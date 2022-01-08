import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScreenshotController _screenshotController = ScreenshotController();
  var _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          widget.appTitle,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        /** For Sharing The Card */
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              final appDirectory = (await getExternalStorageDirectory())!.path;
              File imgFile = File('$appDirectory/wish_card.png');
              _screenshotController.capture().then((value) {
                setState(() {
                  _image = value;
                  imgFile
                      .writeAsBytes(value!.buffer.asUint8List())
                      .whenComplete(() => Share.shareFiles(
                          ['$appDirectory/wish_card.png'],
                          text: "#Sharing Wishing App"));
                });
              });
            },
            icon: const Icon(
              Icons.share,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  //** For Taking Screenshot Of Any Widget

                  Screenshot(
                    controller: _screenshotController,
                    child: Card(
                      color: const Color(0xFF656EE7),
                      margin: const EdgeInsets.all(5.0),
                      shadowColor: Colors.grey,
                      elevation: 10.0,
                      child: Container(
                        height: 350,
                        decoration: _image != null
                            ? BoxDecoration(
                                image: DecorationImage(
                                    image: Image.memory(_image).image),
                              )
                            : const BoxDecoration(color: Colors.transparent),
                        child: TextField(
                          cursorHeight: 3.5.h,
                          cursorColor: Colors.grey,
                          style: TextStyle(
                            fontSize: 20.0.sp,
                          ),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          maxLines: null,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Write Your Wishes Here...",
                            hintStyle: GoogleFonts.aldrich(
                              fontSize: 15.sp,
                            ),
                          ),
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            paste: true,
                            selectAll: true,
                            cut: true,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //TODO: ADDING IMAGES IN NEW UPDATE

                  // ** ADDING IMAGE BUTTON */
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            // ignore: avoid_print
                            print("Open Gallery To Add Image");
                          },
                          child: Container(
                            child: const Icon(
                              Icons.add_a_photo_sharp,
                              color: Colors.black,
                            ),
                            height: 50.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5.0,
                                  blurRadius: 15.0,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: const Color(0xFF00C497),
      //   onPressed: () => Get.to(() => const ColorPickerDemo()),
      //   label: const Text("Change Color"),
      //   icon: const Icon(
      //     Icons.navigate_next,
      //     size: 35,
      //   ),
      // ),
    );
  }
}
