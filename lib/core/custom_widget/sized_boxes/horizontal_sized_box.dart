import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSizedBox extends StatelessWidget {
  const HorizontalSizedBox(this.width, {Key? key, this.color})
      : super(key: key);
  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: ColoredBox(
        color: color ?? Colors.transparent,
      ),
    );
  }
}
