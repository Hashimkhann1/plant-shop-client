import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:plant_cli/utils/app_colors/app_colors.dart';
import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';
import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc_event/loading_bloc_event.dart';


class ContactUsViewModel {

  final String _baseUrl = '';

  Future sendEmail(BuildContext context, String name , email , message) async {
    context.read<LoadingBloc>().add(SetLoading());
    try{
      Map<String, dynamic> templateParams = {
        'from_name': name,
        'message': message,
        'reply_to': email
      };

      await emailjs.send(
          'service_141pr1q',
          'template_e17n209',
          templateParams,
          const emailjs.Options(
          publicKey: 'iAqhK2kiqidm2gNn2',
          privateKey: 'TLBzMHOHCDsVG56IGcCRp',
        ),
      ).then((value){
        context.read<LoadingBloc>().add(SetLoading());
        toastMessage(context, "Mail sended Successfully");
      });

    }catch(error){
      context.read<LoadingBloc>().add(SetLoading());
      toastMessage(context, "Mail not sended try again later");
      print("Error while sending email for conact from >>> ContactUsViewModel $error");
    }
  }

  void toastMessage(BuildContext context , String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 3,
        backgroundColor: AppColors.primaryColor,
        textColor: Colors.white,
        fontSize: 16.0,
    );
  }

}