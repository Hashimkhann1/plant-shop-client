

import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text_button.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';

class MyCustomeAppbar extends StatelessWidget {
  const MyCustomeAppbar({super.key, required this.onTap,required this.aboutOnTap,required this.categoriesOnTap,this.openDrawerOnPressed});

  final void Function()? onTap;
  final void Function()? aboutOnTap;
  final void Function()? categoriesOnTap;
  final void Function()? openDrawerOnPressed;



  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;



    return Container(
      width: width,
      height: height * 0.1,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: Responsive.isMobile(context) ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Responsive.isMobile(context) ? IconButton(onPressed: openDrawerOnPressed,
                  icon: const Icon(Icons.menu , color: AppColors.whiteColor,)) : const SizedBox(),
              SizedBox(width: Responsive.isMobile(context) ? 6 : 0,),
              !Responsive.isMobile(context) ? Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: height * 0.08,
                  child: ClipOval(
                      child: Image.asset(
                        'images/greenAndGreenLogo.png',
                        fit: BoxFit.cover,
                      ),)
                ),
              ) : const SizedBox()
              // Container(
              //   width: width * 0.06,
              //   height: height,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.yellow,width: 6),
              //     shape: BoxShape.circle,
              //     image: DecorationImage(
              //       image: AssetImage(),
              //       fit: BoxFit.cover
              //     )
              //   ),)
            ],
          ),
          Responsive.isMobile(context) ? const SizedBox() : Row(
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
              MyTextButton(
                title: "About",
                fontSize: 19,
                fontWeight: FontWeight.bold,
                textColor: AppColors.whiteColor,
                onTap: aboutOnTap,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              MyTextButton(
                title: "Categories",
                fontSize: 19,
                fontWeight: FontWeight.bold,
                textColor: AppColors.whiteColor,
                onTap: categoriesOnTap
              ),
              SizedBox(
                width: width * 0.02,
              ),
              MyTextButton(
                title: "Contact Us",
                fontSize: 19,
                fontWeight: FontWeight.bold,
                textColor: AppColors.whiteColor,
                onTap: onTap
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
