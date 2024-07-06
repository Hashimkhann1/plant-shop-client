import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text.dart';


class MyTextButton extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final void Function()? onTap;
  final bool isLoading;
  const MyTextButton(
      {super.key,
      required this.title,
      this.fontWeight,
      this.fontSize,
      this.textColor,
      this.backgroundColor,
        this.borderRadius = 0,
      this.height,
      this.width,
      this.padding,
      this.margin,
      this.alignment = Alignment.center,
      this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        alignment: alignment,
        decoration: BoxDecoration(
            color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: isLoading ? CircularProgressIndicator(color: AppColors.whiteColor,) : MyText(
          title: title,
          color: textColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
