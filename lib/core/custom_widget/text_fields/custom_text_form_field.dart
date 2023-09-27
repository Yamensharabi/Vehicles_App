import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../sized_boxes/vertical_sized_box.dart';

// import '../../constants/fonts.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final Function validator;
  final String hintText;
  final void Function()? onTap;
  TextEditingController? controller;
  bool obscure;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool multiLines;
  TextInputType keyboardType;
  final String? label;
  final TextDirection? textDirection;
  double? suffixPadding;
  double? prefixPadding;
  CustomTextFormField({
    super.key,
    required this.validator,
    required this.hintText,
    this.suffixPadding,
    this.prefixPadding,
    this.prefixIcon,
    this.obscure = false,
    this.multiLines = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.suffixIcon,
    this.label,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* Text(
          label!,
          style: context.textTheme.bodyMedium,
        ),
        SizedBox(
          height: 10.h,
        ), */
        SizedBox(
          //  height: 60.h,
          child: TextFormField(
            textDirection: textDirection ?? TextDirection.rtl,
            onTap: onTap,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            maxLength: multiLines ? 300 : null,
            maxLengthEnforcement:
                MaxLengthEnforcement.truncateAfterCompositionEnds,
            maxLines: multiLines ? 5 : 1,
            obscureText: obscure,
            controller: controller,
            cursorColor: AppColors.mainColor,
            style: context.textTheme.bodyMedium!.copyWith(fontSize: 15),
            keyboardType: keyboardType,
            validator: (value) => validator(value),
            decoration: InputDecoration(
              prefixIcon: multiLines
                  ? Container(
                      height: 80,
                      width: 10,
                      alignment: Alignment.topCenter,
                      child: prefixIcon,
                    )
                  : prefixIcon != null
                      ? Padding(
                          padding: EdgeInsets.all(prefixPadding ?? 0),
                          child: prefixIcon,
                        )
                      : null,
              suffixIcon: Padding(
                padding: EdgeInsets.all(suffixPadding ?? 0),
                child: suffixIcon,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.mainColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              // filled: true,
              hintTextDirection: textDirection ?? TextDirection.rtl,
              // fillColor: AppColors.grey,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const VerticalSizedBox(16),
      ],
    );
  }
}
