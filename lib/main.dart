// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Notifications Count',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String channelUrl = "https://www.youtube.com/c/Techi4u";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notifications Count",
            style: TextStyle(fontSize: 14.0),
          ),
          actions: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 1.3.h, right: 5.w),
                  child: Icon(
                    Icons.notifications,
                    size: 32.0,
                  ),
                ),
                Positioned(
                  top: 1.5.h,
                  left: 4.w,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      // put here your dynamic value
                      "101",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20.h,
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              // alignment: Alignment.center,
              width: MediaQuery.of(context).size.width - 20,
              child: Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "For More flutter tutorial \n Please Follow This Link Thanks",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CupertinoButton(
                      child: const Text('Subscribe'),
                      color: CupertinoColors.activeBlue,
                      onPressed: () async {
                        _launchURL(channelUrl, context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // URl
  void _launchURL(String url, BuildContext context) async {
    try {
      await launch(url);
    } catch (e) {
      Navigator.pop(context);
    }
  }
}
