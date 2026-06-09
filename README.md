# TodoApp Flutter Firebase

A polished Flutter todo application built with Firebase and clean state management. This project demonstrates mobile app architecture, real-time data sync, and a professional UI suitable for portfolios and internship review.

## Overview

This app is a task manager that stores todo items in Cloud Firestore and updates the UI using the BLoC pattern. The implementation includes task creation, deletion, completion toggle, and a modern dark-themed interface.

## Key Features

- Task creation with title and description
- Toggle task completion status
- Delete tasks
- Persistent storage using Firebase Cloud Firestore
- Clean state management with `flutter_bloc`
- Modular folder structure for maintainability
- Dark-themed UI designed for readability and polish

## Technologies Used

- Flutter
- Dart
- Firebase Core
- Cloud Firestore
- `flutter_bloc` for state management
- `equatable` for immutable data models
- Material design and custom theming

## Architecture and Process

This project is structured using a feature-based approach under `lib/Features`:

- `Data` - Firestore service and repository implementation
- `Domain` - task model and domain data definitions
- `Presentation` - screens, widgets, and BLoC logic

The development process focused on:

1. Defining an immutable task model using `Equatable`
2. Implementing a repository layer for Firestore persistence
3. Managing UI state with `ProductBloc`, events, and states
4. Designing a polished interface with a responsive add-task sheet
5. Maintaining repo hygiene by ignoring local configuration files and build artifacts

## Installation

1. Clone the repository:

```bash
git clone https://github.com/Kahaf-Soomro/TodoApp-Flutter-Firebase.git
cd TodoApp-Flutter-Firebase
```

2. Install dependencies:

```bash
flutter pub get
```

3. Configure Firebase:

- Add your Firebase `google-services.json` to `android/app/`
- Add your Firebase `GoogleService-Info.plist` to `ios/Runner/`

4. Run the app:

```bash
flutter run
```

## Future Improvements

Potential enhancements:

- Add Firebase Auth for user-specific task lists
- Add edit and reminder support for tasks
- Add categories, priority labels, and search
- Add unit and widget tests to improve reliability

## Notes

The repo ignores machine-specific local files such as `android/local.properties` and `android/app/google-services.json` so sensitive configuration is not committed.
