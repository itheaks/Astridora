import 'package:astridora/OnBoarding/components/title.dart';
import 'package:flutter/material.dart';

// This is the best practice
//import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Text recognition", "description": "Recognise and extract text from images", "image": "assets/q1.gif"},
    {
      "text": "Image labeling",
      "description": "Identify objects, locations, activities, animal species, products and more",
      "image": "assets/q2.gif"
    },
    {
      "text": "Face detection",
      "description": "Detect faces and facial landmarks, now with Face Contours",
      "image": "assets/q3.gif"
    },
    {
      "text": "Object detection and tracking",
      "description": "Detect, track and classify objects in live camera and static images",
      "image": "assets/q4.gif"
    },
    {
      "text": "Barcode scanning",
      "description": "Scan and process barcodes",
      "image": "assets/q5.gif"
    },
    {
      "text": "Language ID",
      "description": "Detect the language of text",
      "image": "assets/q6.gif"
    },
    {
      "text": "On-device translation",
      "description": "Translate text from one language to another",
      "image": "assets/q7.gif"
    },
    {
      "text": "Smart Reply",
      "description": "Generate text replies based on previous messages",
      "image": "assets/q8.gif"
    },
    {
      "text": "Landmark recognition",
      "description": "Identify popular landmarks in an image",
      "image": "assets/q9.gif"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: const Key('your_key_value_here'),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Navigator.pushNamed(context, '/q1');
                        break;
                      case 1:
                        Navigator.pushNamed(context, '/q2');
                        break;
                      case 2:
                        Navigator.pushNamed(context, '/q3');
                        break;
                      case 3:
                        Navigator.pushNamed(context, '/q4');
                        break;
                      case 4:
                        Navigator.pushNamed(context, '/q5');
                        break;
                      case 5:
                        Navigator.pushNamed(context, '/q6');
                        break;
                      case 6:
                        Navigator.pushNamed(context, '/q7');
                        break;
                      case 7:
                        Navigator.pushNamed(context, '/q8');
                        break;
                      case 8:
                        Navigator.pushNamed(context, '/q9');
                        break;
                    }
                  },
                  child: TitleHead(
                    image: splashData[index]["image"]!,
                    text: splashData[index]['text']!,
                    description: splashData[index]['description']!,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                          (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(flex: 1),
                  DefaultButton(
                    text: "Welcome",
                    onPressed: () {
                      switch (currentPage) {
                        case 0:
                          Navigator.pushNamed(context, '/q1');
                          break;
                        case 1:
                          Navigator.pushNamed(context, '/q2');
                          break;
                        case 2:
                          Navigator.pushNamed(context, '/q3');
                          break;
                        case 3:
                          Navigator.pushNamed(context, '/q4');
                          break;
                        case 4:
                          Navigator.pushNamed(context, '/q5');
                          break;
                        case 5:
                          Navigator.pushNamed(context, '/q6');
                          break;
                        case 6:
                          Navigator.pushNamed(context, '/q7');
                          break;
                        case 7:
                          Navigator.pushNamed(context, '/q8');
                          break;
                        case 8:
                          Navigator.pushNamed(context, '/q9');
                          break;
                      }
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      margin: const EdgeInsets.only(right: 5),
      height: 17,
      width: currentPage == index ? 30 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color.fromRGBO(255, 87, 34, 1)
            : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fixedSize: const Size(250, 50),
          primary: Colors.white,
          backgroundColor: const Color.fromRGBO(255, 108, 0, 1.0),
        ),
        onPressed: onPressed, // Remove the onPressed callback
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
