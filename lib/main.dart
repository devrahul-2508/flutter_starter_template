import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/modules/home/cubits/home_cubit.dart';
import 'package:flutter_template/modules/home/provider/filter_model.dart';
import 'package:flutter_template/modules/home/repository/home_repository.dart';
import 'package:flutter_template/modules/home/ui/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilterModel()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit(HomeRepository())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}
