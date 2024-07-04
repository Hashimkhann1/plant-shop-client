

import 'package:plant_cli/utils/view.dart';

class HomeSectionView extends StatelessWidget {
  HomeSectionView({super.key,this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Expanded(
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
                fontSize: Responsive.isMobile(context) ? 14 : 16,
                textAlign: TextAlign.center,
              ),
              MyText(
                title: "Let’s Bring the Spring to Your Home",
                color: AppColors.whiteColor,
                fontSize: Responsive.isMobile(context) ? 27 : 50,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              MyTextButton(
                title: "About Us",
                onTap: onTap,
                textColor: AppColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                backgroundColor: AppColors.primaryColor,
                width: Responsive.isMobile(context)
                    ? width * 0.28
                    : width * 0.12,
                height: height * 0.05,
                borderRadius: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
