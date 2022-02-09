import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "MyHomePage"
          // MaterialPageRoute(
          //   builder: (context) => const MyHomePage(
          //     appTitle: '',
          //   ),
          // ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Sizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: Image.asset(
                        "assets/images/SS.gif",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 250.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Wish Your Friends 😉",
                      style: GoogleFonts.mcLaren(
                        fontSize: 15.0.sp,
                        color: const Color(0xFF656EE7),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
