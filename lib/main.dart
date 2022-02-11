import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wish_card/component/splash_screen.dart';

import 'component/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ///** This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'WISHES CARD',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          routes: <String, WidgetBuilder>{
            "Splash Screen": (BuildContext context) => const SplashScreen(),
            "MyHomePage": (BuildContext context) =>
                const MyHomePage(appTitle: "WISHES")
          },
        );
      },
    );
  }
}
