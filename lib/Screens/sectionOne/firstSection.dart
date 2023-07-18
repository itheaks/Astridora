// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors, file_names

import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'message_style.dart';

class SpeechScreen extends StatefulWidget {
  static String routeName = "/SpeechScreen";
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  ScrollController _controller = ScrollController();
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Press the Listen button and start speaking';
  double _confidence = 1.0;

  List<MessageStyle> message = [
    MessageStyle('Press the Listen button and start speaking', 0)
  ];
  final _messageController = TextEditingController();
  String qmsg = '';

  @override
  void initState() {
    super.initState();
  }

  void add(String str, int i) {
    setState(() {
      message.add(MessageStyle(str, i));
      Timer(Duration(milliseconds: 100), () {
        _controller.animateTo(_controller.position.maxScrollExtent,
            duration: Duration(microseconds: 50), curve: Curves.easeOut);
      });
    });
  }

  Future<void> _SimpleDialogCreator(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Choose any shortcut"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop("Help!");
              },
              child: const Text('Help!'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop("Can you help me?");
              },
              child: const Text('Can you help me?'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop("Excuse me");
              },
              child: const Text('Excuse me'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop("Can you give me this bottle?");
              },
              child: const Text('Can you give me this bottle?'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop("Can you tell me the way to the hospital?");
              },
              child: const Text('Can you tell me the way to the hospital?'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop("Thanks for your help");
              },
              child: const Text('Thanks for your help'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        add(result, 1);
      });
    }
  }

  _dialogCreator(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        TextEditingController customController = TextEditingController();
        return AlertDialog(
          title: const Text("Enter your Message"),
          content: TextField(
            controller: customController,
          ),
          actions: [
            Container(
              child: TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  String message = customController.text.toString();
                  Navigator.of(context).pop(message);
                },
              ),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        add(result, 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
        backgroundColor: Color.fromRGBO(113, 48, 148, 1),
      ),
      backgroundColor: const Color.fromRGBO(36, 36, 62, 1),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarGlow(
            animate: _isListening,
            glowColor: Theme.of(context).primaryColor,
            endRadius: 60.0,
            duration: const Duration(milliseconds: 2000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: Tooltip(
              message: 'press again to stop',
              child: FloatingActionButton.extended(
                heroTag: "listen",
                onPressed: () {
                  _listen();
                },
                icon: Icon(
                  _isListening ? Icons.mic : Icons.mic_none,
                  size: 25,
                ),
                label: Text(
                  _isListening ? "Stop" : "Listen",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton.extended(
            heroTag: "text",
            onPressed: () {
              _dialogCreator(context);
            },
            label: Text(
              "Text",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: Icon(
              Icons.message,
              size: 25,
            ),
          ),
          FloatingActionButton.extended(
            heroTag: "msg",
            onPressed: () {
              _SimpleDialogCreator(context);
            },
            label: Text(
              "Shortcuts",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: Icon(
              Icons.quickreply_outlined,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 600,
              child: ListView.separated(
                shrinkWrap: true,
                controller: _controller,
                itemBuilder: (context, index) => message[index],
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                itemCount: message.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
      if (_text != null) {
        add(_text, 0);
      } else {
        _listen();
        _text = "**We couldn't hear you, try again...**";
      }
    }
  }
}
