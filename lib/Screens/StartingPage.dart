import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'package:untitled/animation/FadeIn.dart';

class StartingPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: 720,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assest/pic2.jpg"), fit: BoxFit.fill)),
          child: Stack(children: <Widget>[
            Positioned(
              bottom: 40,
              right: 40,
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("page2");
                  },
                  child: Text(
                    "  LOGIN  ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 40,
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("page3");
                  },
                  child: Text(
                    "  SIGNUP ",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              child: FadeIn(
                1,
                Container(
                  margin: EdgeInsets.only(top: 80, left: 20),
                  child: Text(
                    "R",
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 160,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              child: FadeIn(
                2,
                Container(
                  margin: EdgeInsets.only(top: 130, left: 110),
                  child: Text(
                    "A",
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 90,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              child: FadeIn(
                3,
                Container(
                  margin: EdgeInsets.only(top: 130, left: 174),
                  child: Text(
                    "V",
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 90,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              child: FadeIn(
                4,
                Container(
                  margin: EdgeInsets.only(top: 130, left: 230),
                  child: Text(
                    "E",
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 90,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              child: FadeIn(
                5,
                Container(
                  margin: EdgeInsets.only(top: 130, left: 275),
                  child: Text(
                    "N",
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 90,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              child: FadeIn(
                7,
                Container(
                  margin: EdgeInsets.only(top: 120, left: 330),
                  child: Text(
                    ".",
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 100,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
