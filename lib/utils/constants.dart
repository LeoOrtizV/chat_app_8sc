import 'package:flutter/material.dart';

class AppConstants {

  //App Info
  static const String appName = 'Flutter Chat';
  static const String appVersion = '1.0.0';

  //ZegoCloud Credentials
  // replaces with your actual appid and appsign
  static const int zegoAppID = 925068293;
  static const String zepoAppSign = 'cb2da8ab5fa455dda579486b774c0df0580116c91f7fa062f9a7c287cb289702';

  // Colors
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFF4CAF50);
  static const Color accentColor = Color(0xFFFF6584);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardColor = Colors.white;
  static const Color textPrimaryColor = Color(0xFF212121);
  static const Color textSecondaryColor = Color(0xFF757575);

  // Gradients
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF5A52FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ); // LinearGradient

  // Text Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: textPrimaryColor,
  );

  static const TextStyle bodyTextSecondary = TextStyle(
    fontSize: 14,
    color: textSecondaryColor,
  );

  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;

  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusCircular = 50.0;

  // Firestore Collections
  static const String usersCollection = 'users';
  static const String chatsCollection = 'chats';
  static const String messagesCollection = 'messages';

  static const int minPasswordLength = 6;
  static const int maxNameLength = 50;

  // Error Messages
  static const String networkError = 'Network error. Please check your connection';
  static const String unknownError = 'Something went wrong. Please try again';
  static const emailInvalid = 'Please enter a valid email address';
  static const passwordShort = 'Password must be at least 6 characters';
  static const String fieldsEmpty = 'Please fill in all fields';

  // Sucess Messages
  static const String loginSuccess = 'Login successful!';
  static const String signupSuccess = 'Account created successfully!';
  static const String logoutSuccess = 'Logged out successfully!';

  static const String defaultAvatar = 'https://ui-avatars.com/api/?background=6C63FF&color=fff&name=';

  // Zegocloud Features
  static const bool enableVideoCall = true;
  static const bool enableVoiceCall = true;
  static const bool enableScreenShare = false;
  static const bool enableChat = true;

}

String getUserAvatar(String name) {
  return '${AppConstants.defaultAvatar}${Uri.encodeComponent(name)}';
}

String formatTimeStamp(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays == 0) {
    if (difference.inHours == 0) {
      if (difference.inMinutes == 0) {
        return 'Just now';
      }
      return '${difference.inMinutes}m ago';
    }
    return '${difference.inHours}h ago';
  }else if(difference.inDays == 1){
    return 'Yesterday';
  }
  else if(difference.inDays < 7){
    return '${difference.inDays}d ago';
  }
  else {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}