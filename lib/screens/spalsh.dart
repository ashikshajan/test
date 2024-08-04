import 'package:ateam_map/apputil/app_util.dart';
import 'package:ateam_map/screens/home/home_page.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () async {
      bool serviceenabled;
      LocationPermission permission = await Geolocator.checkPermission();
      serviceenabled = await Geolocator.isLocationServiceEnabled();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        enablePermission(context);
        // NAddressDialogue(
        //     message: "Enable Location Permission",
        //     ontap: () async {
        //       permission = await Geolocator.requestPermission();
        //       if (permission == LocationPermission.whileInUse ||
        //           permission == LocationPermission.always) {
        //         await context
        //             .read<NewAddressController>()
        //             .setCurrentLocation();
        //         Get.to(() => AddressMap());
        //       }
        //     });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
