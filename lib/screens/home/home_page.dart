import 'package:ateam_test/screens/home/home_widget.dart';
import 'package:ateam_test/view_model/map_vm.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          children: [
            CircleAvatar(
                backgroundColor: Colors.grey[400],
                radius: 30,
                child: Icon(Icons.person) //Text
                ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("  Ashik Shajan"), Text("  Ashik1@gmail.com")],
            ),
          ],
        ), //,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24),
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
