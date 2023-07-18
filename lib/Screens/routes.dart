
import 'package:astridora/Screens/sectionOne/firstSection.dart';
import 'package:astridora/important/q1.dart';
import 'package:astridora/important/q2.dart';
import 'package:astridora/important/q3.dart';
import 'package:astridora/important/q4.dart';
import 'package:astridora/important/q7.dart';
import 'package:flutter/widgets.dart';
import '../OnBoarding/onBoard.dart';
import '../important/q5.dart';
import '../important/q6.dart';
import '../important/q8.dart';
import '../important/q9.dart';
import 'getStarted.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  OnBoardScreen.routeName: (context) => OnBoardScreen(),
  getStarted.routeName: (context) => getStarted(),
  SpeechScreen.routeName: (context) => SpeechScreen(),
  // '/q1': (context) => TextRecognitionPage(),
  // '/q2': (context) => Chapter2(),
  // '/q3': (context) => Chapter3(),
  // '/q4': (context) => ObjectDetection(),
  // '/q5': (context) => Chapter5(),
  // '/q6': (context) => Chapter6(),
  // '/q7': (context) => Chapter7(),
  // '/q8': (context) => Chapter8(),
  // '/q9': (context) => Chapter9(),
 
};
