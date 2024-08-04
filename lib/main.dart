
import 'package:ateam_map/apputil/app_util.dart';
import 'package:ateam_map/screens/spalsh.dart';
import 'package:ateam_map/view_model/map_vm.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MapboxOptions.setAccessToken(AppUtils.accessToken);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<MapVM>(create: (_) => MapVM()),
  ], child: const MaterialApp(home: SpalshScreen())));
}