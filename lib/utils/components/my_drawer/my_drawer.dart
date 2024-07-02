

import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text_button.dart';

import '../my_text.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key, this.onTap, this.aboutOnTap, this.categoriesOnTap,this.homeOnTap});

  final void Function()? homeOnTap;
  final void Function()? onTap;
  final void Function()? aboutOnTap;
  final void Function()? categoriesOnTap;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            SizedBox(height: height * 0.12,),

            MyText(title: "App Logo",fontSize: 27,fontWeight: FontWeight.bold,color: AppColors.primaryColor,),
            SizedBox(height: height * 0.04,),

           MyTextButton(
             title: "Home",
             fontSize: 22,
             fontWeight: FontWeight.bold,
             textColor: AppColors.primaryColor,
             onTap: homeOnTap,
           ),
           SizedBox(
             height: height * 0.01,
           ),
           // GALLERY Button
           // MyTextButton(title: "Gallery", fontSize: 19, fontWeight: FontWeight.bold,),
           // SizedBox(width: width * 0.02,),
           // Contact Us button
           MyTextButton(
             title: "About",
             fontSize: 22,
             fontWeight: FontWeight.bold,
             textColor: AppColors.primaryColor,
             onTap: aboutOnTap,
           ),
           SizedBox(
             height: height * 0.01,
           ),
           MyTextButton(
               title: "Categories",
               fontSize: 22,
               fontWeight: FontWeight.bold,
               textColor:AppColors.primaryColor,
               onTap: categoriesOnTap
           ),
           SizedBox(
             height: height * 0.01,
           ),
           MyTextButton(
               title: "Contact Us",
               fontSize: 22,
               fontWeight: FontWeight.bold,
               textColor: AppColors.primaryColor,
               onTap: onTap
           ),
           SizedBox(
             height: height * 0.01,
           )
          ],
        ),
      )
    );
  }
}
