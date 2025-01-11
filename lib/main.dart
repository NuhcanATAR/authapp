import 'package:authapp/feature/home/bloc/cubit.dart';
import 'package:authapp/feature/profile_edit/bloc/cubit.dart';
import 'package:authapp/feature/sign_in/bloc/cubit.dart';
import 'package:authapp/feature/sign_up/bloc/cubit.dart';
import 'package:authapp/feature/splash/splash_view.dart';
import 'package:authapp/feature/users/bloc/cubit.dart';
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
        BlocProvider<SignInBloc>(
          create: (BuildContext context) => SignInBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (BuildContext context) => SignUpBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => ProfileBloc(),
        ),
        BlocProvider<UsersBloc>(
          create: (BuildContext context) => UsersBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
