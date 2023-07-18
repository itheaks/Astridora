// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names

import 'package:astridora/OnBoarding/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_screen/OnbordingData.dart';
import 'package:flutter_onboarding_screen/flutteronboardingscreens.dart';


class OnBoardScreen extends StatelessWidget {
  static String routeName = "/OnBoarding";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen

    return Scaffold(
      backgroundColor: const Color.fromRGBO(36, 36, 62, 1),
      body: Body(
      ),
    );
  }
}
