

import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/components/my_text_button.dart';
import 'package:plant_cli/utils/components/my_text_form_field.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';

class ContactSectionView extends StatelessWidget {
  const ContactSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: Responsive.isDesktop(context) ?  width * 0.54 : width * 0.88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          MyText(
            title: "Contact",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          MyTextFormFeild(
            hintText: "Name",
            focusedBorderColor: AppColors.primaryColor,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          MyTextFormFeild(
            hintText: "Email",
            focusedBorderColor: AppColors.primaryColor,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          MyTextFormFeild(
            hintText: "Message",
            maxLines: 4,
            focusedBorderColor: AppColors.primaryColor,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          MyTextButton(
            title: 'Send',
            textColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            height: height * 0.06,
            width: Responsive.isDesktop(context) ?  width * 0.12 : width * 0.28,
            borderRadius: 8,
          ),

          SizedBox(
            height: height * 0.02,
          )
        ],
      ),
    );
  }
}
