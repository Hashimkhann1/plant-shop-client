import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_custome_appbar/my_custome_appbar.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/components/my_text_button.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';
import 'package:plant_cli/view/home_view/about_section_view/about_section_view.dart';
import 'package:plant_cli/view/home_view/slider_section_view/slider_section_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final aboutSectinokey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// welcome section
            Container(
              width: width,
              height:
                  Responsive.isTablet(context) || Responsive.isMobile(context)
                      ? height * 0.68
                      : height * 0.99,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: const AssetImage('images/headerImage.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35), BlendMode.darken),
                ),
              ),
              child: Column(
                children: [
                  /// Custome App bar
                  MyCustomeAppbar(),

                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MyText(
                              title:
                                  "WELCOME TO THE GREEN AND GREEN MD LLC NURSERY & LAWN CARE",
                              color: AppColors.whiteColor,
                              fontSize: 16,
                              textAlign: TextAlign.center,
                            ),
                            MyText(
                              title: "Let’s Bring the Spring to Your Home",
                              color: AppColors.whiteColor,
                              fontSize: Responsive.isMobile(context) ? 36 : 50,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            MyTextButton(
                              title: "About Us",
                              onTap: () {
                                scrollToSection(aboutSectinokey);
                              },
                              textColor: AppColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              backgroundColor: AppColors.primaryColor,
                              width: width * 0.12,
                              height: height * 0.05,
                              borderRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Responsive.isMobile(context)
                  ? height * 0.06
                  : Responsive.isTablet(context)
                      ? 0.1
                      : height * 0.12,
            ),

            /// About us
            Container(key: aboutSectinokey, child: const AboutSectionView()),
            SizedBox(
              height: height * 0.07,
            ),

            /// plant images

            /// slider
            const SliderSectionView(),

            SizedBox(
              height: height * 0.07,
            ),

            /// fotter
            Container(
              width: width,
              height: height * 0.12,
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.04)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MyText(
                    title: "Green and green md llc\nNursery & lawn care",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
            )
          ],
        ),
      ),
    );
  }
}
