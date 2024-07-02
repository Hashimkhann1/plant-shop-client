import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';

class CategorySectionView extends StatelessWidget {
  CategorySectionView({super.key});

  List categoryPlants  = [
    {
      "image": "https://www.meccacandleco.com/cdn/shop/articles/indoorplants.jpg?v=1562521927",
      "name" : "Indoor Plants"
    },
    {
      "image": "https://www.bloomingbackyard.com/wp-content/uploads/2021/06/Azalea-1024x680.jpg.webp",
      "name" : "Shrubs Plants"
    },
    {
      "image": "https://image.made-in-china.com/202f0j00cEPkODmIHogQ/Nearly-Natural-Artificial-Plants-Lily-Bamboo-Indoor.jpg",
      "name" : "Privacy Plants"
    },
    {
      "image": "https://rukminim2.flixcart.com/image/750/900/xif0q/plant-sapling/z/q/y/no-perennial-yes-real-live-dark-red-rose-live-plant-hybrid-for-original-imagsquguuqkdgjw.jpeg?q=20&crop=false",
      "name" : "Roses"
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
          height: Responsive.isTablet(context) ? height * 0.7 : height,

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
                        height: height * 0.08,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.01, vertical: height * 0.02),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.5),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(title: categoryPlants[index]['name'],fontSize: Responsive.isMobile(context) ? 17 : 20,fontWeight: FontWeight.bold,color: AppColors.whiteColor,),
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
