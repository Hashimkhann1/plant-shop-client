//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:plant_cli/utils/app_colors/app_colors.dart';
// import 'package:plant_cli/utils/components/my_text.dart';
// import 'package:plant_cli/utils/components/my_text_button.dart';
// import 'package:plant_cli/utils/components/my_text_form_field.dart';
// import 'package:plant_cli/utils/responsive/responsive.dart';
// import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';
// import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc_event/loading_bloc_event.dart';
// import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc_state/loading_bloc_state.dart';
// import 'package:plant_cli/view_model/cntact_us_view_model/contact_us_view_model.dart';
//
// class ContactSectionView extends StatelessWidget {
//   ContactSectionView({
//     super.key,
//   });
//
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController messageController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     return Container(
//       width: Responsive.isDesktop(context) ?  width * 0.54 : width * 0.88,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: height * 0.02,
//           ),
//           const MyText(
//             title: "Contact",
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//             color: AppColors.primaryColor,
//           ),
//           SizedBox(
//             height: height * 0.02,
//           ),
//           Form(
//             key: _formKey,
//               child: Column(
//                 children: [
//                   MyTextFormFeild(
//                     controller: nameController,
//                     hintText: "Name",
//                     focusedBorderColor: AppColors.primaryColor,
//                     validator: (value){
//                       if(value!.isEmpty){
//                         return "Enter your name";
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: height * 0.02,
//                   ),
//                   MyTextFormFeild(
//                     controller: emailController,
//                     hintText: "your Gmail",
//                     focusedBorderColor: AppColors.primaryColor,
//                     validator: (value){
//                       if(value!.isEmpty){
//                         return "Enter your gmail";
//                       }else if(!value.contains("@gmail.com")){
//                         return "Enter valid email";
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: height * 0.02,
//                   ),
//                   MyTextFormFeild(
//                     controller: messageController,
//                     hintText: "Message",
//                     maxLines: 4,
//                     focusedBorderColor: AppColors.primaryColor,
//                     validator: (value){
//                       if(value!.isEmpty){
//                         return "Enter your your message";
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(
//                     height: height * 0.02,
//                   ),
//                 ],
//               )
//           ),
//           BlocBuilder<LoadingBloc , LoadingBlocState>(builder: (context , state) {
//             return MyTextButton(
//               title: 'Send',
//               textColor: AppColors.whiteColor,
//               backgroundColor: AppColors.primaryColor,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               height: height * 0.06,
//               width: Responsive.isDesktop(context) ?  width * 0.12 : width * 0.28,
//               borderRadius: 8,
//               isLoading: state.isLoading,
//               onTap: () {
//                 if(_formKey.currentState!.validate()){
//                   ContactUsViewModel().sendEmail(context, nameController.text.toString(), emailController.text.toString(), messageController.text.toString());
//                 }
//               },
//             );
//           },),
//
//           SizedBox(
//             height: height * 0.02,
//           )
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/utils/components/my_text.dart';
import 'package:plant_cli/utils/components/my_text_button.dart';
import 'package:plant_cli/utils/components/my_text_form_field.dart';
import 'package:plant_cli/utils/responsive/responsive.dart';
import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';
import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc_state/loading_bloc_state.dart';
import 'package:plant_cli/view_model/cntact_us_view_model/contact_us_view_model.dart';

class ContactSectionView extends StatelessWidget {
  ContactSectionView({
    super.key,
  });

  static final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode messageFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: Responsive.isDesktop(context) ? width * 0.54 : width * 0.88,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          const MyText(
            title: "Contact",
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextFormFeild(
                  controller: nameController,
                  hintText: "Name",
                  focusNode: nameFocusNode,
                  focusedBorderColor: AppColors.primaryColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                MyTextFormFeild(
                  controller: emailController,
                  hintText: "your Gmail",
                  focusNode: emailFocusNode,
                  focusedBorderColor: AppColors.primaryColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your gmail";
                    } else if (!value.contains("@gmail.com")) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                MyTextFormFeild(
                  controller: messageController,
                  hintText: "Message",
                  maxLines: 4,
                  focusNode: messageFocusNode,
                  focusedBorderColor: AppColors.primaryColor,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your message";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
          BlocBuilder<LoadingBloc, LoadingBlocState>(
            builder: (context, state) {
              return MyTextButton(
                title: 'Send',
                textColor: AppColors.whiteColor,
                backgroundColor: AppColors.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: height * 0.06,
                width: Responsive.isDesktop(context) ? width * 0.12 : width * 0.28,
                borderRadius: 8,
                isLoading: state.isLoading,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ContactUsViewModel().sendEmail(
                      context,
                      nameController.text.toString(),
                      emailController.text.toString(),
                      messageController.text.toString(),
                    );
                  }
                },
              );
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
        ],
      ),
    );
  }
}
