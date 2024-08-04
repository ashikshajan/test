import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AppUtils {
  // Pass your access token to MapboxOptions so you can load a map

  static bool isDebug = true;
  static const String accessToken =
      "pk.eyJ1IjoiYXNoaWtzaGFqYW4iLCJhIjoiY2x6ZjYyc2FwMHgwOTJpczhzNGF6NzExcSJ9.LMaMGmfbNcUX1NQlHjgrOg";
}

Future<dynamic> enablePermission(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Allow Location Access",
                style: TextStyle(color: Colors.black),
              )),
            ],
          ),
          scrollable: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Colors.blue, width: 2.0)),
          content: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "Please enable location permission for Fabricspa app in your app settings"),
                SizedBox(height: 10),
              ]),
          actions: [
            Row(
              children: [
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () async {
                        print("inside ok");
                        Navigator.pop(context);
                        bool res = await openAppSettings();
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          color: Colors.black,
                          child: const Center(
                              child: Text("Go to app settings",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white))))),
                ),
              ],
            ),
          ],
        );
      });
}

class Log {
  static void print(dynamic msg, {other}) {
    if (AppUtils.isDebug) {
      debugPrint("${other ?? ""} ${msg.toString()}");
      log("${other ?? ""} ${msg.toString().trim()}");
    }
  }
}
