import 'package:ateam_map/view_model/map_vm.dart';
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
        padding: const EdgeInsets.all(15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Consumer<MapVM>(builder: (context, mappController, child) {
            return Column(
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
                          suffixIcon: Icon(Icons.clear),
                          suffixIconColor: Colors.black,
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 8, 0),
                          disabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
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
                          title: Text("${suggestion.properties!.fullAddress}"),
                        );
                      },
                      onSuggestionSelected: (suggestion) async {
                        type == "start"
                            ? mappController.setmapTripStartLocation(
                                suggestion.properties!.fullAddress ?? "",
                                Position(
                                  suggestion.properties!.coordinates!.latitude!
                                      .toDouble(),
                                  suggestion.properties!.coordinates!.longitude!
                                      .toDouble(),
                                ))
                            : mappController.setmapTripEndLocation(
                                suggestion.properties!.fullAddress ?? "",
                                Position(
                                  suggestion.properties!.coordinates!.latitude!
                                      .toDouble(),
                                  suggestion.properties!.coordinates!.longitude!
                                      .toDouble(),
                                ));
                      },
                    )),
                Expanded(
                  child:
                      Stack(alignment: AlignmentDirectional.center, children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MapWidget(
                            onMapCreated: (MapboxMap? mapbox) {
                              mappController.onMapCreated(mapbox!);
                            },
                            cameraOptions: CameraOptions(
                                center: Point(
                                    coordinates: type == "start"
                                        ? Position(
                                            mappController.startLatlong!.lat,
                                            mappController.startLatlong!.lng)
                                        : Position(
                                            mappController.endLatlong!.lat,
                                            mappController.endLatlong!.lng)),
                                zoom: 10,
                                bearing: 0,
                                pitch: 0))
                        // GoogleMap(
                        //     myLocationButtonEnabled: false,
                        //     onMapCreated: (c) {
                        //       controller.onMapCreated(c);
                        //     },
                        //     buildingsEnabled: true,
                        //     initialCameraPosition: CameraPosition(
                        //         target: controller.selectedLatLng, zoom: 15.0),
                        //     onCameraMove: (_) =>
                        //         controller.setTemplatlong(_.target),
                        //     onCameraIdle: () => controller
                        //         .setSelectedLatLng(controller.tempposition),
                        //     onTap: (cameraPos) =>
                        //         controller.setSelectedLatLng(cameraPos)),
                        ),
                    const Positioned(
                        child: Icon(Icons.location_on,
                            color: Colors.red, size: 50))
                  ]),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
