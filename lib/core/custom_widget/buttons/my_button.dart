import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class MyButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget widget;
  final Color? backgroundColor;
  const MyButton(
      {super.key, this.backgroundColor, this.onPressed, required this.widget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Center(child: widget),
      ),
    );
  }
}
