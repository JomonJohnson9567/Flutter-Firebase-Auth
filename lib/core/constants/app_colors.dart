import 'package:flutter/material.dart';

class AppColors {
  // Base Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  // Accents / Brand
  static const Color primaryBlue = Colors.blue;
  static const Color primaryPurple = Colors.purple;
  static const Color primaryOrange = Colors.orange;

  // Gradients
  static const Color gradientStart = Color(0xFF42A5F5); // blue[400]
  static const Color gradientEnd = Color(0xFFAB47BC); // purple[400]

  static const Color avatarGradientStart = Color(0xFF64B5F6); // blue[300]
  static const Color avatarGradientEnd = Color(0xFFBA68C8); // purple[300]

  static const Color logoutGradientStart = Color(0xFF29B6F6);
  static const Color logoutGradientEnd = Color(0xFFAB47BC);

  // Text
  static const Color textDark = Color(0xFF424242); // grey[800]
  static const Color textBlue = Color(0xFF1976D2); // blue[700]
  static const Color textGrey = Color(0xFF757575); // grey[600]

  // Icons
  static const Color iconGrey = Color(0xFFBDBDBD); // grey[400]

  // Backgrounds / Surfaces
  static const Color backgroundLight = Color(0xFFF5F5F5); // grey[100]

  // States
  static const Color error = Color(0xFFEF5350); // red[400]

  // Shadows (Opacity needs to be handled carefully if we want const, usually we defining the base color and applying opacity in usage or defining a non-const getter)
  static final Color cardShadow = Colors.grey.withOpacity(0.1);
  static final Color avatarShadow = Colors.purple.withOpacity(0.3);
}
