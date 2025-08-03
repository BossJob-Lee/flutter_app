import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/setting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(255, 244, 233, 1),
            onPrimary: Color.fromRGBO(001, 244, 233, 1)),
      ),
      home: HomeScreenView(),
      routes: {
        '/home': (context) => HomeScreenView(),
        '/setting': (context) => SettingScreen(),
      },
    );
  }
}
