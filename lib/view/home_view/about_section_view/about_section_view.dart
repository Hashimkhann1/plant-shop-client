


import 'package:flutter/material.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';

class AboutSectionView extends StatelessWidget {
  const AboutSectionView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context) ? width * 0.05 : Responsive.isTablet(context) ? width * 0.06 : width * 0.17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.04,),
          const MyText(
            title: "About Us",
            fontSize: 38,
            fontWeight: FontWeight.w900,
          ),
          SizedBox(height: height * 0.02,),
          MyText(
            title:
            "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form "
                "of a document or a typeface without relying on meaningful content. Lorem "
                "ipsum may be used as a placeholder before the final copy is availableLorem "
                "ipsum is a placeholder text commonly used to demonstrate the visual form of "
                "a document or a typeface without relying on meaningful content. Lorem ipsum "
                "may be used as a placeholder before the final copy is available"
                "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form "
                "of a document or a typeface without relying on meaningful content. Lorem "
                "ipsum may be used as a placeholder before the final copy is availableLorem "
                "ipsum is a placeholder text commonly used to demonstrate the visual form of "
                "a document or a typeface without relying on meaningful content. Lorem ipsum "
                "may be used as a placeholder before the final copy is available",
            fontSize: 19,
            letterSpacing: Responsive.isMobile(context) ? 0.8 : 1,
            height: Responsive.isMobile(context) ? 1.2 : 1.5,
          ),
        ],

      ),
    );
  }
}
