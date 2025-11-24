import 'package:chat_app_8sc/screens/auth/login_screen.dart';
import 'package:chat_app_8sc/screens/home/home_screen.dart';
import 'package:chat_app_8sc/services/auth_service.dart';
import 'package:chat_app_8sc/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
    with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  final AuthService _authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupAnimations();
    _checkAuthState();
  }

  void _setupAnimations(){
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController, 
        curve: Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController, 
        curve: Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _animationController.forward();
  }

  Future<void> _initializeZego(String userId, String userName)async{
    try{
      await ZIMKit().connectUser(id: userId, name: userName);

      await ZegoUIKitPrebuiltCallInvitationService().init(
        appID: AppConstants.zegoAppID, 
        appSign: AppConstants.zepoAppSign,
        userID: userId,
        userName: userName,
        plugins: [ZegoUIKitSignalingPlugin()],
      );
      print('success');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _checkAuthState()async{
    await Future.delayed(Duration(milliseconds: 2000));

    if(!mounted) return;

    final currentUser = _authService.currentUser;

    if(currentUser != null){
      try{
        final userData = await _authService.getCurrentUserData();

        if(userData != null && mounted){
          await _authService.updateUserOnlineStatus(userData.uid, true);

          await _initializeZego(userData.uid, userData.name);

          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } 
        } else {
            _navigateToLogin();
        }
      } catch (e) {
        _navigateToLogin();
      }
    } else{
      _navigateToLogin();
    }
  }

  void _navigateToLogin(){
    if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppConstants.primaryGradient,
        ),
            child: SafeArea(child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline,
                        color: AppConstants.primaryColor,
                        size: 60,
                      ),
                    ),
                  ),
                ),

                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      AppConstants.appName,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      "Connect, Chat & Call",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.9),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 48),
                  FadeTransition(opacity: _fadeAnimation,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}