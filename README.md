# Flutter Machine Task: Clean Architecture Auth App

A minimal, production-grade Flutter application built to demonstrate **Clean Architecture**, **BLoC State Management**, and **Firebase Authentication**. This project was developed as a solution to a specific machine task challenge, focusing on code modularity, strict separation of concerns, and best practices.

## 🎯 Objective

Build a minimal Flutter application using Firebase Authentication that allows a user to register, log in, and view their profile details. The application adheres to **Clean Architecture** principles and uses **flutter_bloc** for state management with persistent authentication state.

## 🚀 Key Features

### 1. Unified Login / Register Screen
- **Single Page Interface**: Seamless toggle between Login and Registration modes.
- **Form Handling**:
  - Fields for **Name**, **Email**, **Password**, and **Confirm Password**.
  - **Email Validation**: Regex-based format checking.
  - **Password Matching**: Ensures "Password" and "Confirm Password" are identical.
- **Firebase Integration**: Users are authenticated via **Firebase Email & Password Authentication**.

### 2. Home Dashboard
- Displays the authenticated user's **Name** and **Email** fetched directly from the Firebase User object.
- **Logout Functionality**: Clears the authentication state and redirects to the Login page.

### 3. State Management & Persistence
- **BLoC Pattern**: `flutter_bloc` is used to manage authentication and form states, ensuring a clear separation between the UI and business logic.
- **Persistent Auth**: The app checks for an existing user session on launch (`AuthWrapper`). If a user is logged in, they are taken directly to the Home Page.

### 4. Clean Architecture
The codebase is structured into three distinct layers to ensure scalability and testability:
- **Presentation Layer**: UI Widgets and BLoC implementation.
- **Domain Layer**: Entities and Abstract Repositories (Pure Dart code).
- **Data Layer**: Concrete Repositories and Data Sources (Firebase implementation).

## 🛠️ Technology Stack

| Component | Technology |
|bound|---|
| **Framework** | Flutter |
| **Language** | Dart |
| **State Management** | flutter_bloc |
| **Authentication** | Firebase Auth (Email/Password) |
| **Dependency Injection** | get_it |
| **Value Equality** | equatable |

## 📂 Project Structure

```
lib/
├── core/                  # Shared utilities and constants
│   ├── constants/         # App Colors, Strings
│   └── di/                # Dependency Injection (GetIt) setup
├── features/              # Feature modules
│   └── auth/
│       ├── data/          # Data Layer (Repositories, Data Sources)
│       ├── domain/        # Domain Layer (Entities, UseCases)
│       └── presentation/  # Presentation Layer (Pages, Widgets, BLoCs)
├── main.dart              # App Entry Point
└── firebase_options.dart  # Firebase Configuration
```

## ⏱️ Development Constraints

This project was structured to meet the following time-boxed requirements:
- **Firebase Setup**: 20 mins
- **Architecture Setup**: 30 mins
- **UI Implementation**: 30 mins
- **Auth Integration**: 35 mins
- **State Handling**: 40 mins
- **Refinement**: ~25 mins

## 🏁 Getting Started

1.  **Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/machine_tsk.git
    cd machine_tsk
    ```

2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Setup Firebase**:
    - Ensure your `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) is placed in the correct directory.

4.  **Run the App**:
    ```bash
    flutter run
    ```
