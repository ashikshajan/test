import 'package:ateam_map/screens/home/home_widget.dart';
import 'package:ateam_map/view_model/map_vm.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(18),
        )),
      ),
      body: Consumer<MapVM>(builder: (context, mappController, child) {
        return Column(
          children: [
            Expanded(
                child: HomePageCard(
              type: "start",
            )),
            Expanded(
                child: HomePageCard(
              type: "end",
            ))
          ],
        );
      }),
    );
  }
}
