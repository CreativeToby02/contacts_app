import 'package:contacts_app/common/glass_bottom_nav_bar.dart';
import 'package:contacts_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const MyGlassBottomNavigator(),
    );
  }
}
