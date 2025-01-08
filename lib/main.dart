import 'package:authapp/feature/sign_in/bloc/cubit.dart';
import 'package:authapp/feature/splash/splash_view.dart';
import 'package:authapp/product/initialize/initialize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await AppStart.initStartApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
