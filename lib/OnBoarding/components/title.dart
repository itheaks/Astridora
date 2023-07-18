import 'package:flutter/material.dart';

class TitleHead extends StatelessWidget {
  TitleHead({
    Key? key,
    required this.text,
    required this.description,
    required this.image,
  }) : super(key: key);

  final String text;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Padding(padding: EdgeInsets.only(bottom: 15)),
        Text(
          text,
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(padding: EdgeInsets.only(bottom: 15)),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white54,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white54.withOpacity(0.9),
                  spreadRadius: 20,
                  blurRadius: 5,
                  offset: Offset(0, 50),
                ),
              ],
            ),
            child: Image.asset(
              image,
              height: 265,
              width: 265,
            ),
          ),
        ),
      ],
    );
  }
}
