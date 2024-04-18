import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class nav extends StatefulWidget {
  const nav({super.key});

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  Color red = Colors.red;
  Color black = Colors.black;
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  Color color3 = Colors.red;

  bool check = false;
  bool history = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        margin: EdgeInsets.fromLTRB(12, 0, 12, 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 135, 191, 237),
              Color.fromARGB(255, 205, 225, 239)
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, blurRadius: 10, offset: Offset(4, 4))
          ],
        ),
        child: ClipRRect(
            child: Padding(
          padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    color1 = red;
                    color2 = Colors.black;
                    color3 = Colors.black;
                  });
                },
                icon: Icon(
                  Icons.history,
                  color: color1,
                  size: 38,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    color2 = red;
                    color1 = Colors.black;
                    color3 = Colors.black;
                  });
                },
                icon: Icon(
                  Icons.task,
                  color: color2,
                  size: 38,
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      color1 = Colors.black;
                      color3 = red;
                      color2 = Colors.black;
                    });
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.check,
                    color: color3,
                    size: 38,
                  )),
            ],
          ),
        )));
  }
}
