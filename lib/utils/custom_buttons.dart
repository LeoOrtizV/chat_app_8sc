import 'package:chat_app_8sc/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final IconData? icon;
  final bool isOutlined;
  final double borderRadius;
  const CustomButton({
    super.key, 
    required this.text, 
    required this.onPressed, 
    this.isLoading = false, 
    this.backgroundColor, 
    this.textColor, 
    this.width, 
    this.height, 
    this.icon, 
    this.isOutlined = false, 
    this.borderRadius = AppConstants.borderRadiusMedium,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56,
      child: isOutlined ? _buildOutlinedButton() : _buildFilledButton(),
    );
  }

  Widget _buildFilledButton(){
    return ElevatedButton(onPressed: isLoading ? null : onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppConstants.primaryColor,
      foregroundColor: textColor ?? Colors.white, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(borderRadius),
      ),
      elevation: 2,
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.paddingSmall,
        horizontal: AppConstants.borderRadiusMedium,
      )
    ), 
    
    child: isLoading ? _buildLoadingIndicator(): _buildContent(),),
  }

  Widget _buildOutlinedButton(){
    return OutlinedButton(onPressed: isLoading ? null : onPressed,
    style: OutlinedButton.styleFrom(
      foregroundColor: backgroundColor ?? AppConstants.primaryColor,
      side: BorderSide(
        color: backgroundColor ?? AppConstants.primaryColor,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(borderRadius),
      ),
      elevation: 2,
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.paddingSmall,
        horizontal: AppConstants.borderRadiusMedium,
      )
    ), 
    
    child: isLoading ? _buildLoadingIndicator(isOutlined: true): _buildContent(),),
  }
} //Cierre Final
