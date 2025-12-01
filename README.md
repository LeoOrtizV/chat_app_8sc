# 📱 Flutter Chat App – Firebase + ZegoCloud

Real-Time Messaging | Voice & Video Calls | User Profiles

## Getting Started

This project implements a fully functional real-time chat application built with Flutter, powered by Firebase for authentication and database services, and ZegoCloud for high-quality voice and video calls.
It includes user registration, login, instant messaging, profile editing, and call features with a clean and modular architecture.

## 🚀 Main Features
- **🔐 Authentication (Firebase Auth)**
  - User registration (Sign Up)
  - User login (Sign In)
  - Auto session persistence
  - Real-time field validation

- **💬 Real-Time Messaging (Cloud Firestore)**
  - Instant one-to-one chat
  - Live message updates
  - User list with profiles
  - Clean chat interface

- **🎥 Voice & Video Calls (ZegoCloud)**
  - One-on-one video calls
  - One-on-one voice calls
  - Prebuilt UI from ZegoCloud
  - Automatic camera/microphone handling

- **👤 User Profile System**
  - View user profile
  - Edit name and photo
  - Profile images cached for performance

- **🎨 Modern UI**
  - Custom widgets
  - Reusable components
  - Smooth navigation

## ⚙️ Dependencies Used

This project integrates Firebase for backend services and ZegoCloud for communication features.

```yaml
dependencies:
  cupertino_icons: ^1.0.8

  # Firebase
  firebase_core: ^4.2.1
  firebase_auth: ^6.1.2
  cloud_firestore: ^6.1.0
  firebase_storage: ^13.0.4

  # ZegoCloud
  zego_uikit_prebuilt_call: ^4.16.21
  zego_uikit_signaling_plugin: ^2.8.8
  zego_zimkit: ^1.18.13
  zego_uikit: ^2.28.23

  # State Management & Utilities
  provider: ^6.1.1
  get: ^4.6.6
  image_picker: ^1.0.7
  cached_network_image: ^3.3.1
  intl: ^0.20.2
  fluttertoast: ^9.0.0
```

## 🔥 Firebase Packages

| Package | Purpose |
|--------|----------|
| firebase_core | Initializes Firebase in Flutter |
| firebase_auth | User login/registration |
| cloud_firestore | Real-time chat messages & user data |
| firebase_storage | Stores profile pictures and files |


## 🎥 ZegoCloud Packages

| Package | Purpose |
|---------|----------|
| zego_uikit_prebuilt_call | Fully built video call interface |
| zego_uikit_signaling_plugin | Handles call invitations & signaling |
| zego_zimkit | Messaging and communication events |
| zego_uikit | Core UI and audio/video logic |


## 🧩 Utility Packages

| Package | Purpose |
|---------|---------|
| provider | State management |
| get | Routing & reactive utilities |
| image_picker | Select images from camera/gallery |
| cached_network_image | Cached profile images |
| intl | Formats timestamps in chat |
| fluttertoast | Simple popup notifications |


## 📂 Project Structure
You may adjust this structure as the project expands.

```text
lib/
 ├── main.dart
 ├── firebase_options.dart

 ├── models/
 │     └── user_model.dart

 ├── screens/
 │     ├── auth/
 │     │     ├── login_screen.dart
 │     │     └── signup_screen.dart
 │     ├── home/
 │     │     └── home_screen.dart
 │     ├── profile/
 │     │     ├── profile_screen.dart
 │     │     └── splash_screen.dart

 ├── services/
 │     └── auth_service.dart

 ├── utils/
 │     └── constants.dart

 └── widgets/
       ├── custom_button.dart
       ├── custom_text_field.dart
       ├── user_tile.dart
       └── ...
```

## ⚙️ Environment Setup

1️⃣ Install Dependencies
```bash
   flutter pub get
 ```
2️⃣ Firebase Setup

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).

2. Enable Authentication (Email/Password) and Firestore Database.

3. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) and place them in the respective platform directories.

4. Ensure you have:
   - Flutter SDK installed
   - Firebase CLI installed and configured

3️⃣ ZegoCloud Setup
1. Go to [ZegoCloud Console](https://console.zegocloud.com/).

2. Create a new project and obtain your AppID and AppSign.

3. Inserts values into yout constants file.

4️⃣ Run the App
```bash
   flutter run
 ```


## 🖼️ Chat App Demo

![Chat App Demo](assets/Video-Project.gif)


## 🔗 Repository
- [Leonardo’s Repository](https://github.com/LeoOrtizV/chat_app_8sc)  


## 📝 Conclusions
> “This project integrates Firebase, Cloud Firestore, and ZegoCloud to build a modern real-time chat application with video calling capabilities. It reinforces competencies in Flutter development, state management, modular architecture, and backend integration through practical implementation.”

## 🎥 Tutorial Credit

This project was built following the guidance of the video:
“Complete Chat App in Flutter with Firebase & ZegoCloud | Real-Time Messaging + Voice/Video Calls”
by Dear Programmer on YouTube.

Video Link:
[Watch Tutorial](https://www.youtube.com/watch?v=SzWKXTGmV2U&t=10790s)

The structure, concepts, and integrations with Firebase and ZegoCloud were inspired by the techniques demonstrated in this tutorial.
All code has been adapted, refactored, and extended to fit the needs and objectives of this project.


## 👨‍💻 Developer
- **Leonardo Yeret Ortiz Valle**
- **Docente:** Rodrigo Fidel Gaxiola Sosa
- **Grupo:** 8SB -- December 2025
