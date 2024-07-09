

import 'dart:convert';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height: height * 0.03,),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: height * 0.17,
                    child: ClipOval(
                      child: Image.asset(
                        'images/logo_with_white_bg.png',
                        fit: BoxFit.cover,
                        width: width,
                        height: height,
                      ),)
                ),
              ),
            ),
            SizedBox(height: height * 0.02,),

           MyTextButton(
             width: width * 0.7,
             alignment: Alignment.topLeft,
             padding: EdgeInsets.only(left: 6,top: 5,bottom: 5),
             margin: EdgeInsets.only(left: width * 0.02),
             borderRadius: 6,
             title: "Home",
             fontSize: 22,
             fontWeight: FontWeight.bold,
             textColor: AppColors.primaryColor,
             onTap: homeOnTap,
             backgroundColor: Colors.grey.withOpacity(0.2),
           ),
           SizedBox(
             height: height * 0.01,
           ),
           // GALLERY Button
           // MyTextButton(title: "Gallery", fontSize: 19, fontWeight: FontWeight.bold,),
           // SizedBox(width: width * 0.02,),
           // Contact Us button
           MyTextButton(
             width: width * 0.7,
             alignment: Alignment.topLeft,
             padding: EdgeInsets.only(left: 6,top: 5,bottom: 5),
             margin: EdgeInsets.only(left: width * 0.02),
             borderRadius: 6,
             title: "About",
             fontSize: 22,
             fontWeight: FontWeight.bold,
             textColor: AppColors.primaryColor,
             onTap: aboutOnTap,
             backgroundColor: Colors.grey.withOpacity(0.2),
           ),
           SizedBox(

             height: height * 0.01,
           ),
           MyTextButton(
               width: width * 0.7,
               alignment: Alignment.topLeft,
             padding: EdgeInsets.only(left: 6,top: 5,bottom: 5),
             margin: EdgeInsets.only(left: width * 0.02),
                borderRadius: 6,
               title: "Categories",
               fontSize: 22,
               fontWeight: FontWeight.bold,
               textColor:AppColors.primaryColor,
               onTap: categoriesOnTap,
             backgroundColor: Colors.grey.withOpacity(0.2),
           ),
           SizedBox(
             height: height * 0.01,
           ),
           MyTextButton(
               width: width * 0.7,
                alignment: Alignment.topLeft,
             padding: EdgeInsets.only(left: 6,top: 5,bottom: 5),
             margin: EdgeInsets.only(left: width * 0.02),
                borderRadius: 6,
               title: "Contact Us",
               fontSize: 22,
               fontWeight: FontWeight.bold,
               textColor: AppColors.primaryColor,
               onTap: onTap,
             backgroundColor: Colors.grey.withOpacity(0.2),
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
