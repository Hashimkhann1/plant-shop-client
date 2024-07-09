import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_cli/view/home_view/home_view.dart';
import 'package:plant_cli/view_model/bloc/loading_bloc/loading_bloc/loading_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoadingBloc()),
        ],
        child: MaterialApp(
        title: 'Green & Green Md LLC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
    ),
    home: const HomeView()
    ));
  }
}
