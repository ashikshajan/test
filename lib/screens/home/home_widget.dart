import 'package:ateam_test/view_model/map_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomePageCard extends StatelessWidget {
  String type;
  HomePageCard({
    super.key,
    required this.type,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Consumer<MapVM>(builder: (context, mappController, child) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 35,
                      child: TypeAheadField(
                        hideOnEmpty: true,
                        textFieldConfiguration: TextFieldConfiguration(
                          enabled: true,
                          cursorColor: Colors.black,
                          enableInteractiveSelection: true,
                          controller: type == "start"
                              ? mappController.startLocation
                              : mappController.endLocation,
                          decoration: InputDecoration(
                            hintText: "Enter Location",
                            suffixIcon: InkWell(
                                onTap: () {
                                  mappController.cleardata(type);
                                },
                                child: Icon(Icons.clear)),
                            suffixIconColor: Colors.black,
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 8, 0),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        suggestionsCallback: (pattern) {
                          return mappController.getMapPlaces(pattern);
                        },
                        loadingBuilder: (context) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.black,
                            backgroundColor: Colors.black,
                          ));
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title:
                                Text("${suggestion.properties!.fullAddress}"),
                          );
                        },
                        onSuggestionSelected: (suggestion) async {
                          type.toString() == "start"
                              ? mappController.setmapTripStartLocation(
                                  suggestion.properties!.fullAddress ?? "",
                                  Position(
                                    suggestion
                                        .properties!.coordinates!.longitude!
                                        .toDouble(),
                                    suggestion
                                        .properties!.coordinates!.latitude!
                                        .toDouble(),
                                  ))
                              : mappController.setmapTripEndLocation(
                                  suggestion.properties!.fullAddress ?? "",
                                  Position(
                                    suggestion
                                        .properties!.coordinates!.longitude!
                                        .toDouble(),
                                    suggestion
                                        .properties!.coordinates!.latitude!
                                        .toDouble(),
                                  ));
                        },
                      )),
                  Expanded(
                    child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MapWidget(
                                key: ValueKey("mapWidget"),
                                onMapCreated: (MapboxMap? mapbox) {
                                  mappController.onMapCreated(mapbox!);
                                },
                                cameraOptions: CameraOptions(
                                    center: Point(
                                        coordinates: Position(
                                      mappController.currentLocation!.longitude,
                                      mappController.currentLocation!.latitude,
                                    )),
                                    zoom: 10,
                                    bearing: 0,
                                    pitch: 0),
                              )),
                        ]),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
