import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer();
  CameraPosition initialLocation = CameraPosition(zoom: 18, target: LatLng(37.807438, -122.419924));
  var currentTheme = false.obs;

  String _darkMapStyle;
  String _lightMapStyle;

  Future _loadMapStyles() async {
    _darkMapStyle = await rootBundle.loadString('assets/map_styles/dark.json');
    _lightMapStyle = await rootBundle.loadString('assets/map_styles/light.json');
  }

  @override
  void onInit() {
    print("Init Called");
    _loadMapStyles();
    super.onInit();
  }

  changeTheme() async {
    var controller = await mapController.future;
    if (Get.isDarkMode) {
      Get.changeThemeMode(ThemeMode.light);
      controller.setMapStyle(_lightMapStyle);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      controller.setMapStyle(_darkMapStyle);
    }
  }
}
