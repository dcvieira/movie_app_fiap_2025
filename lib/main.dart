import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_app_fiap25/common/constants.dart';
import 'package:movie_app_fiap25/common/myhttp.dart';
import 'package:movie_app_fiap25/widgets/botton_nav.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kBackgroundColor,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: kBackgroundColor,
        ),
      ),
      home: const BottomNav(),
    );
  }
}
