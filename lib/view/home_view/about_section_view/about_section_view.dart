


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

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
            color: AppColors.primaryColor,
          ),
          SizedBox(height: height * 0.02,),
          RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Welcome to Green & Green Md LLC Nursery and Lawn Care! We are your trusted "
                          "local nursery and lawn care experts, dedicated to providing the highest"
                      " quality plants and comprehensive lawn care services Our mission is to bring"
                      " beauty and sustainability to your outdoor spaces. We are committed to "
                      "offering eco-friendly solutions that enhance the natural environment.Green "
                      "& Green Md LLC Nursery and Lawn Care Founded in 2022, and grown from a small "
                      "local nursery to a full-service lawn care and landscaping provider. Our "
                      "growth is a testament to our commitment to quality and customer satisfaction.At "
                      "Green & Green Md LLC, we offer a wide range of services including plant sales, "
                      "landscaping design, lawn maintenance, and personalized garden consultations."
                      "And We'd love to hear from you! Contact us at ",
                    style: TextStyle(
                        fontSize: Responsive.isMobile(context) ? 17 : 19,
                      letterSpacing: Responsive.isMobile(context) ? 0.8 : 1,
                      height: Responsive.isMobile(context) ? 1.2 : 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "+1 443-900-4317, ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      fontSize: Responsive.isMobile(context) ? 17 : 19,
                      letterSpacing: Responsive.isMobile(context) ? 0.8 : 1,
                      height: Responsive.isMobile(context) ? 1.2 : 1.5,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri telUri = Uri(scheme: 'tel', path: '+14439004317');
                        if (await canLaunch(telUri.toString())) {
                          await launch(telUri.toString());
                        } else {
                          throw 'Could not launch $telUri';
                        }
                      },
                  ),
                  TextSpan(
                    text: "greenandgreenmdllc@gmail.com ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      fontSize: Responsive.isMobile(context) ? 17 : 19,
                      letterSpacing: Responsive.isMobile(context) ? 0.8 : 1,
                      height: Responsive.isMobile(context) ? 1.2 : 1.5,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'greenandgreenmdllc@gmail.com',
                        );
                        if (await canLaunch(emailUri.toString())) {
                          await launch(emailUri.toString());
                        } else {
                          throw 'Could not launch $emailUri';
                        }
                      },
                  ),
                  TextSpan(
                    text: ",or visit our nursery at ",
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 17 : 19,
                      letterSpacing: Responsive.isMobile(context) ? 0.8 : 1,
                      height: Responsive.isMobile(context) ? 1.2 : 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "5028 e Oliver st Baltimore md USA.",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: Responsive.isMobile(context) ? 17 : 19,
                      letterSpacing: Responsive.isMobile(context) ? 0.8 : 1,
                      height: Responsive.isMobile(context) ? 1.2 : 1.5,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri mapUri = Uri(
                          scheme: 'https',
                          path:
                          'www.google.com/maps/place/5028+E+Oliver+St,+Baltimore,+MD+21205,+USA/@39.3090138,-76.5589097,17.06z/data=!4m6!3m5!1s0x89c804245a8279c5:0x3d139f8870c035c5!8m2!3d39.30903!4d-76.556222!16s%2Fg%2F11dznv5fn0?entry=ttu',
                        );
                        if (await canLaunch(mapUri.toString())) {
                          await launch(mapUri.toString());
                        } else {
                          throw 'Could not launch $mapUri';
                        }
                      },
                  ),
                ]
              ),
          )
        ],

      ),
    );
  }
}
