import 'package:chat_app_8sc/screens/auth/login_screen.dart';
import 'package:chat_app_8sc/screens/home/home_screen.dart';
import 'package:chat_app_8sc/services/auth_service.dart';
import 'package:chat_app_8sc/utils/constants.dart';
import 'package:chat_app_8sc/widgets/custom_button.dart';
import 'package:chat_app_8sc/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zimkit/zego_zimkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final AuthService _authService = AuthService();

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp()async{
    if(!_formKey.currentState!.validate()){
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try{
      final userModel = await _authService.signUp(
        name: _nameController.text,
        email: _emailController.text.trim(),
        password: _passwordController.text
      );

      if(userModel != null){
        await ZIMKit().connectUser(id: userModel.uid, name: userModel.name);

        await ZegoUIKitPrebuiltCallInvitationService().init(
          appID: AppConstants.zegoAppID,
          appSign: AppConstants.zepoAppSign,
          userID: userModel.uid,
          userName: userModel.name,
          plugins: [ZegoUIKitSignalingPlugin()],
        );

        Fluttertoast.showToast(
          msg: AppConstants.signupSuccess,
          backgroundColor: AppConstants.secondaryColor,
        );

        if(mounted){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen())
          );
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(),
      backgroundColor: AppConstants.accentColor,
      toastLength: Toast.LENGTH_LONG,
      );
    }
    finally{
      if(mounted){
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppConstants.primaryGradient),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(AppConstants.paddingLarge),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: 50,
                        color: AppConstants.primaryColor
                      ),
                    ),
                    SizedBox(height: 24),
                    Text("Create Account",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Sign up to get started",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),

                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.all(AppConstants.paddingLarge),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          AppConstants.borderRadiusLarge,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _nameController, 
                            hintText: 'Full Name',
                            prefixIcon: Icons.person_outline,
                            textCapitalization: TextCapitalization.words,
                            validator: TextFieldValidators.name,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            controller: _emailController, 
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: TextFieldValidators.email,
                          ),
                          SizedBox(height: 16),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: 'Password',
                            prefixIcon: Icons.lock_outline,
                            isPassword: true,
                            validator: TextFieldValidators.password,
                            ),
                          SizedBox(height: 16),
                          CustomTextField(
                            controller: _confirmPasswordController,
                            hintText: 'Confirm Password',
                            prefixIcon: Icons.lock_outline,
                            isPassword: true,
                            validator: (value) =>
                                TextFieldValidators.confirmPassword(
                                  value,
                                  _passwordController.text
                                  ),
                            ),

                          SizedBox(height: 24),
                          CustomButton(
                            text: "Sign Up", 
                            onPressed: _signUp,
                            isLoading: _isLoading,
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account",
                                style: TextStyle(
                                  color: AppConstants.textSecondaryColor
                                ),
                              ),
                              CustomTextButton(
                                text: "Log In", 
                                onPressed: _navigateToLogin,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingMedium,
                      ),
                      child: Text(
                        "By signing up, you agree to our Terms of Service and Privacy Policy",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}