

import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/components/my_text_button.dart';

class MyCustomeAppbar extends StatelessWidget {
  const MyCustomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.06,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const MyText(title: "App Name",fontSize: 22,fontWeight: FontWeight.bold,color: AppColors.whiteColor,),

          Row(
            children: [
              const MyTextButton(
                title: "Home",
                fontSize: 19,
                fontWeight: FontWeight.bold,
                textColor: AppColors.whiteColor,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              // GALLERY Button
              // MyTextButton(title: "Gallery", fontSize: 19, fontWeight: FontWeight.bold,),
              // SizedBox(width: width * 0.02,),
              // Contact Us button
              const MyTextButton(
                title: "Contact Us",
                fontSize: 19,
                fontWeight: FontWeight.bold,
                textColor: AppColors.whiteColor,
              ),
              SizedBox(
                width: width * 0.02,
              ),
            ],
          )
        ],
      ),
    );
  }
}
