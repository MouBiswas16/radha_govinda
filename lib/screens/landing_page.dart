// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:radha_govinda/screens/wave_widget.dart';

import '../widgets/outlined_text_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: size.height,
              color: Colors.amber,
            ),
            AnimatedPositioned(
              // It helps to speed up the animation with duaration property
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              // top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: WaveWidget(
                  size: size, yOffset: size.height / 3.0, color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // center icon with buble liquid animation
                Container(
                  // height: 120.0,
                  // width: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/temple.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                // header
                Text(
                  "Ambaji Temple",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
                // descrption
                Text(
                  "Back on appoinment with a",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "right place",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
                OutlinedTextButton(
                  text: "Get Started",
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
