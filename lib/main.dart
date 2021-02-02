import 'package:flutter/material.dart';
import 'package:flutter_map_with_systemtheme/map_controller.dart';
import 'package:flutter_map_with_systemtheme/theme.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.light,
      darkTheme: Themes.dark,
      home: Mapper(),
    );
  }
}

class Mapper extends StatefulWidget {
  @override
  _MapperState createState() => _MapperState();
}

class _MapperState extends State<Mapper> {
  MapController _mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("Map"),
          actions: [
            FlatButton(
              onPressed: () {
                _mapController.changeTheme();
              },
              child: Text("Change Theme"),
            )
          ],
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          buildingsEnabled: false,
          myLocationEnabled: true,
          initialCameraPosition: _mapController.initialLocation,
          onMapCreated: (GoogleMapController controller) {
            _mapController.mapController.complete(controller);
          },
        ),
      ),
    );
  }
}
