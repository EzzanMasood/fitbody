import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Border? border;
  final Gradient? gradient;
  final Color? color;
  final Widget child;
  final IconData? icon;
  final Color? iconColor;
  final ImageProvider? image;

  const CustomButton({
    super.key,
    required this.onTap,
    this.height,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.border,
    this.gradient,
    this.icon,
    this.iconColor,
    this.color,
    required this.child,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        alignment: Alignment.center, // ✅ Fix: Ensures content is centered
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          gradient: gradient,
          color: gradient == null ? color : null,
        ),
        child: Stack(
          alignment: Alignment.center, // ✅ Fix: Ensures all elements inside are centered
          children: [
            if (icon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0), // ✅ Adjusted spacing
                  child: Icon(icon, color: iconColor),
                ),
              ),
            if (image != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0), // ✅ Adjusted spacing
                  child: Image(
                    image: image!,
                    height: 24.0,
                    width: 24.0,
                  ),
                ),
              ),
            Center(child: child), // ✅ Fix: Ensures text remains centered
          ],
        ),
      ),
    );
  }
}