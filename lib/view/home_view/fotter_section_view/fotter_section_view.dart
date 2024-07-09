
import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';
import 'package:plant_cli/utils/view.dart';

class FotterSectionView extends StatelessWidget {
  const FotterSectionView({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: Responsive.isMobile(context) ? height * 0.43 : width < 370 ? height * 0.92 : height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.03)),
      child: Responsive.isMobile(context) ? Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Center(
                  child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: height * 0.13,
                      child: ClipOval(
                        child: Image.asset(
                          'images/logo_with_white_bg.png',
                          fit: BoxFit.cover,
                        ),)
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        title: "Green and green md llc\nNursery & lawn care",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      MyText(
                        title: "Address: 5028 East oliver st\nBaltimore MD USA",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ],
                  ),

                  /// Social buttons
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.blueAccent,
                        size: 40,
                      ))
                ],
              ),
            ],
          ),

        ],
      ) : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: height * 0.14,
                    child: ClipOval(
                      child: Image.asset(
                        'images/logo_with_white_bg.png',
                        fit: BoxFit.cover,
                      ),)
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    title: "Green and green md llc\nNursery & lawn care",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  MyText(
                    title: "Address: 5028 East oliver st\nBaltimore MD USA",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ],
              ),

            ],
          ),

          /// Social buttons
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blueAccent,
                    size: 34,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
