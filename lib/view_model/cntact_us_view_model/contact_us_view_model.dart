import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:emailjs/emailjs.dart' as emailjs;
import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';
import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc_event/loading_bloc_event.dart';


class ContactUsViewModel {

  final String _baseUrl = '';

  Future sendEmail(BuildContext context, String name , email , message) async {
    context.read<LoadingBloc>().add(SetLoading());
    try{
      // final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
      // final responce = await http.post(
      //   url,
      //   headers: {
      //     'contentType': 'application/json'
      //   },
      //   body: json.encode({
      //     'service_id': ''service_141pr1q'',
      //     'template_id': 'template_5c8roto',
      //     'user_id': 'iAqhK2kiqidm2gNn2',
      //     'template_params': {
      //       'from_name': name,
      //       'message': message,
      //       'user_email': email,
      //     }
      //   })
      // ).then((value) {

      // });
      // print(responce);

      Map<String, dynamic> templateParams = {
        'from_name': name,
        'message': message,
        'user_email': email
      };

      await emailjs.send(
          'service_141pr1q',
          'template_5c8roto',
          templateParams,
          const emailjs.Options(
          publicKey: 'iAqhK2kiqidm2gNn2',
          privateKey: 'TLBzMHOHCDsVG56IGcCRp',
        ),
      ).then((value){
        context.read<LoadingBloc>().add(SetLoading());
      });

    }catch(error){
      context.read<LoadingBloc>().add(SetLoading());
      print("Error while sending email for conact from >>> ContactUsViewModel $error");
    }
  }

}