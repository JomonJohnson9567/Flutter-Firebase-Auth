import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String name, String email, String password);
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user!;
      return UserEntity(
        uid: user.uid,
        email: user.email!,
        displayName: user.displayName ?? '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
        throw AuthException('Incorrect email or password');
      }
      throw AuthException(e.message ?? 'Authentication failed');
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<UserEntity> register(
    String name,
    String email,
    String password,
  ) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user!;
    await user.updateDisplayName(name);
    await user.reload(); // Reload to get updated display name
    final updatedUser = firebaseAuth.currentUser!; // Get reloaded user

    return UserEntity(
      uid: updatedUser.uid,
      email: updatedUser.email!,
      displayName: updatedUser.displayName ?? name,
    );
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      return UserEntity(
        uid: user.uid,
        email: user.email!,
        displayName: user.displayName ?? '',
      );
    }
    return null;
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}
