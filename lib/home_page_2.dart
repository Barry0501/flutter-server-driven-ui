// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage2Widget extends StatefulWidget {
  const HomePage2Widget({super.key});

  @override
  State<HomePage2Widget> createState() => HomePage2yWidgetState();
}

class HomePage2yWidgetState extends State<HomePage2Widget> {
  List buttonList = [];
  @override
  void initState() {
    super.initState();
    buttonList = [
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
      ButtonWidget(
        bgColor: ColorButton.red,
      ),
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
      ButtonWidget(
        bgColor: ColorButton.transparent,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomePage2Widget'),
        ),
        body: SingleChildScrollView(
          child: Column(
            // 10 button
            children: [
// show buttonList
              for (final item in buttonList) item

              // ButtonWidget(
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final idRandom = Random().nextInt(buttonList.length);
            final colorRandom = colorButtonMap.entries
                .elementAt(Random().nextInt(colorButtonMap.length))
                .key;

            setState(() {
              buttonList[idRandom] = ButtonWidget(
                bgColor: colorRandom,
              );
            });
          },
          child: Icon(Icons.restart_alt_outlined),
        ));
  }
}

enum ColorButton {
  transparent,
  red,
  green,
  blue,
  yellow,
  orange,
  pink,
  purple,
  brown,
  black,
  white
}

final colorButtonMap = {
  ColorButton.transparent: Colors.transparent,
  ColorButton.red: Colors.red,
  ColorButton.green: Colors.green,
  ColorButton.blue: Colors.blue,
  ColorButton.yellow: Colors.yellow,
  ColorButton.orange: Colors.orange,
  ColorButton.pink: Colors.pink,
  ColorButton.purple: Colors.purple,
  ColorButton.brown: Colors.brown,
  ColorButton.black: Colors.black,
  ColorButton.white: Colors.white,
};

class ButtonWidget extends StatelessWidget {
  final String title;
  final ColorButton bgColor;
  const ButtonWidget({
    Key? key,
    this.title = 'button',
    this.bgColor = ColorButton.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text('$title'),
          style: ElevatedButton.styleFrom(
            backgroundColor: colorButtonMap[bgColor], // use the color map here
          ),
        ),
      ),
    );
  }
}
