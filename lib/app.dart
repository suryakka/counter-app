import 'package:counter_app/common/config/injector.dart';
import 'package:counter_app/common/constants/common_constant.dart';
import 'package:counter_app/presentation/bloc/counter_bloc.dart';
import 'package:counter_app/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: CommonConstant.appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BlocProvider(
          create: (context) => getIt<CounterBloc>(),
          child: MyHomePage(title: CommonConstant.appSubtitle),
        ));
  }
}
