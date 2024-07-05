import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/components/my_text_button.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';

class CategorySectionView extends StatelessWidget {
  CategorySectionView({super.key});

  List categoryPlants  = [
    {
      "image": "https://cdn.shopify.com/s/files/1/0059/8835/2052/files/pink-lady-apple_d2694a66-537e-4883-a0b9-ffce7a23e783_1.jpg?v=1707327538",
      "name" : "Fruite Trees",
      "category" : "Fruite",
    },
    {
      "image": "https://hips.hearstapps.com/hmg-prod/images/ornamental-garden-royalty-free-image-1705084130.jpg",
      "name" : "Shrubs",
      "category" : "Shrubs Plants"
    },
    {
      "image": "https://m.media-amazon.com/images/I/61z3ZMyVSdL._AC_UF894,1000_QL80_.jpg",
      "name" : "Thugha Gaint",
      'category': "Privacy Tress"
    },
    {
      "image": "https://www.plantingtree.com/cdn/shop/products/3686.jpg",
      "name" : "Emerland Tress",
      'category': "Privacy Tress"
    },
  ];

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        MyText(title: "Categories",fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.primaryColor,),
        SizedBox(height: height * 0.03,),

        Container(
          width: Responsive.isDesktop(context) ?  width * 0.54 : width * 0.9,
          // height: Responsive.isTablet(context) ? height * 0.7 : height,

          child: GridView.builder(
            itemCount: categoryPlants.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 1 : 2,
              childAspectRatio: Responsive.isTablet(context) ? 2/1.9 : Responsive.isMobile(context) ?  1/ 0.55 :  1/0.9,
              mainAxisSpacing: Responsive.isMobile(context) ? 14 : 10,
              crossAxisSpacing: Responsive.isMobile(context) ? 0 : 10,

            ),
            itemBuilder: (context , index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.3),
                          blurRadius: 7,
                          spreadRadius: 2
                      )
                    ],
                    // border: Border.all(color: Colors.orangeAccent,width: 7),
                    image: DecorationImage(
                        image: NetworkImage(categoryPlants[index]['image'].toString()),
                        fit: BoxFit.cover
                    )
                ),

                /// text contaiener
                child: Stack(
                  children: [
                    /// Text container with specific height and color
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        width: width,
                        height: height < 500 ? height * 0.12 :  height * 0.09,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.02),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// name
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(title: categoryPlants[index]['name'],fontSize: Responsive.isMobile(context) ? 16 : 17,fontWeight: FontWeight.bold,color: AppColors.whiteColor,),
                                MyText(title: categoryPlants[index]['category'],fontSize: Responsive.isMobile(context) ? 12 : 14,fontWeight: FontWeight.bold,color: AppColors.whiteColor,),
                              ],
                            ),

                            /// see more button
                            MyTextButton(title: "See more >",textColor: AppColors.whiteColor,fontWeight: FontWeight.w500,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
