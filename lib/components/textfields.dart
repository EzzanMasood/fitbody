import 'package:fitbody/config/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final bool obscureText;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final BorderRadius? borderRadius; // Customizable border radius

  const MyTextField({
    super.key,
    required this.hintText,
    this.labelText,
    this.obscureText = false,
    this.padding,
    this.width,
    this.height,
    this.labelTextColor,
    this.hintTextColor,
    this.suffixIcon,
    this.borderRadius, this.controller, // Added borderRadius parameter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: labelTextColor ?? AppColors.black,
            ),
          ),
        const SizedBox(height: 8),
        SizedBox(
          width: width,
          height: height ?? MediaQuery.of(context).size.height * 0.06,
          child: TextFormField(
             
            controller: controller,
            decoration: InputDecoration(
              contentPadding: padding ??
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(15.0), // Use custom borderRadius
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintTextColor ?? AppColors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(15.0), // Use custom borderRadius
                borderSide: const BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(15.0), // Use custom borderRadius
                borderSide: const BorderSide(color: AppColors.white),
              ),
              fillColor: AppColors.white,
              filled: true,
              suffixIcon: suffixIcon,
            ),
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}