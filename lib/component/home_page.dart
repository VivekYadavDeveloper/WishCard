import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _sendmail(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ("Not Open");
    }
  }

  final ScreenshotController _screenshotController = ScreenshotController();

  ///** To Change The bgColor Of Card
  bool changebgColor = true;
  var color = Colors.white;
  final List<Color> bgColors = <Color>[
    const Color(0xFF24A19C),
    Colors.amberAccent,
    const Color(0xFF1572A1),
    Colors.blueAccent,
    const Color(0xFFA6E3E9),
    const Color(0xFFF67280),
    Colors.cyanAccent,
    const Color(0xFFD9D7F1),
    Colors.deepOrangeAccent,
    Colors.deepPurple,
    Colors.deepPurpleAccent,
    Colors.greenAccent,
    Colors.limeAccent,
    Colors.lightBlueAccent,
    Colors.lime,
    const Color(0xFF28FFBF),
    Colors.tealAccent,
    Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            widget.appTitle,
            style: GoogleFonts.lato(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _sendmail(
                "mailto:vk662967@gmail.org?subject=feedback&body=New%20plugin"),
            icon: const Icon(Icons.mail_outline_rounded),
            color: Colors.redAccent,
          ),
        ],
        //*Next Time Implement

        /** For Sharing The Card */
        //** actions: <Widget>[
        //   IconButton(
        //     onPressed: () async {
        //       final appDirectory = (await getExternalStorageDirectory())!.path;
        //       File imgFile = File('$appDirectory/wish_card.png');
        //       _screenshotController
        //           .capture(
        //               pixelRatio: 3.0, delay: const Duration(milliseconds: 10))
        //           .then((value) {
        //         setState(() {
        //           imgFile
        //               .writeAsBytes(value!.buffer.asUint8List())
        //               .whenComplete(() => Share.shareFiles(
        //                   ['$appDirectory/wish_card.png'],
        //                   text: "#Sharing With Wishing App"));
        //         });
        //       });
        //     },
        //     icon: const Icon(
        //       Icons.share,
        //       size: 30.0,
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ///**For Taking Screenshot Of Card, We Are Using Here Screenshot.
                Screenshot(
                  controller: _screenshotController,
                  child: Card(
                    color: color,
                    //*To Change The Background Color On Press THe Buttons */
                    margin: const EdgeInsets.all(5.0),
                    shadowColor: Colors.grey,
                    elevation: 10.0,
                    child: Center(
                      child: SizedBox(
                        height: 40.h,
                        child: Center(
                          child: TextField(
                            cursorHeight: 3.5.h,
                            cursorColor: const Color(0xFF33425B),
                            style: TextStyle(
                                fontSize: 20.0.sp, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "WISH YOUR FRIENDS...",
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
                  ),
                ),

                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  "TAP TO CHANGE THE COLOR",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                          fontStyle: FontStyle.italic)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(0, 8.0),
                            blurRadius: 5.0)
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 12.5.h,
                    child: ListView.builder(
                      itemExtent: 50,
                      scrollDirection: Axis.horizontal,
                      itemCount: bgColors.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            //TODO: ADDING BUTTON HERE
                            onTap: () {
                              setState(() {
                                changebgColor = !changebgColor;
                                color = bgColors[index];
                                print(bgColors[index]);
                                print("Color Is Change");
                              });
                            },

                            child: Container(
                              width: 20.0.w,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      offset: const Offset(0, 8.0),
                                      blurRadius: 5.0)
                                ],
                                shape: BoxShape.circle,
                                color: bgColors[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //TODO: ADDING IMAGES IN NEW UPDATE

                /// ** Sharing IMAGE BUTTON */
                ///** For Sharing The Image I Used "SHARE_PLUS" Plugin
                ///** Which Automatically Create Image In .PNG Format.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          await _screenshotController
                              .capture(delay: const Duration(milliseconds: 10))
                              .then((image) async {
                            if (image != null) {
                              final directory =
                                  await getApplicationDocumentsDirectory();
                              final imagePath =
                                  await File('${directory.path}/image.png')
                                      .create();
                              await imagePath.writeAsBytes(image);

                              /// Share Plugin
                              await Share.shareFiles([imagePath.path],
                                  text: "#Sharing With Wishing App");
                            }
                          });
                          // ignore: avoid_print
                          print("Sharing The Image ");
                        },
                        child: Container(
                          child: const Icon(
                            Icons.send_sharp,
                            color: Colors.black,
                          ),
                          height: 7.0.h,
                          width: 45.0.w,
                          decoration: BoxDecoration(
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
