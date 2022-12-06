import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_barsalutemple/firebase/VillagesModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VillageMapUI extends StatefulWidget {
  final VillagesModel village;


  const VillageMapUI({Key key, this.village})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VillageState();
  }
}

class VillageState extends State<VillageMapUI> {

  Completer<GoogleMapController> _controller = Completer();

   CameraPosition villageLocation;


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    villageLocation = CameraPosition(
   // target: LatLng((widget.village.latitude), (widget.village.longitude)),
   zoom: 14.4746, target: null,
   );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text((widget.village.name)),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: villageLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),

    );
  }
}
