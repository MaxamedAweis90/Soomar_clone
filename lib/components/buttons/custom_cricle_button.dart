import 'package:flutter/material.dart';

class CustomCircularIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final VoidCallback? onPressed;
  final Widget? navigateTo;
  final BuildContext context;

  const CustomCircularIconButton({
    super.key,
    required this.icon,
    required this.context,
    this.iconColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.size = 27.0,
    this.onPressed,
    this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      padding: const EdgeInsets.all(2),
      child: IconButton(
        icon: Icon(icon, color: iconColor, size: size),
        onPressed: () {
          if (navigateTo != null) {
            Navigator.push(
              this.context,
              MaterialPageRoute(builder: (context) => navigateTo!),
            );
          } else if (onPressed != null) {
            onPressed!();
          }
        },
      ),
    );
  }
}
