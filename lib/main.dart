
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'OnBoarding/onBoard.dart';
import 'Screens/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astridora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: const Color.fromRGBO(255, 182, 74, 1.0),
        splashIconSize: 250,
        splashTransition: SplashTransition.scaleTransition,
        duration: 4000,
        splash: Image.asset('assets/splash.png'),
        nextScreen: OnBoardScreen(),
      ),
      routes: routes,
    );
  }
}
