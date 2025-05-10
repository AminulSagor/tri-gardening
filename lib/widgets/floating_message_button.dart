import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingMessageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingMessageButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: const Color(0xFF0E4B36),
      icon: const Icon(Icons.message, color: Colors.white),
      label: Text(
        'Message',
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
    );
  }
}
