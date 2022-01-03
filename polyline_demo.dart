import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineDemo extends StatefulWidget {
  const PolylineDemo({Key? key}) : super(key: key);

  @override
  _PolylineDemoState createState() => _PolylineDemoState();
}

class _PolylineDemoState extends State<PolylineDemo> {
  //
  LatLng yavatmalLocation = LatLng(20.3899, 78.1307);
  List<LatLng> polyoverLine = [];
  late Polyline polyline;
  //

  @override
  void initState() {
    super.initState();

    //
    polyline = Polyline(
      polylineId: PolylineId('line1'),
      color: Colors.orange.shade300,
      width: 5,
      points: polyoverLine,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: Text('Polygon Demo'),
      ),

      //
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: yavatmalLocation,
            zoom: 15,
          ),
          onLongPress: addLine,
          polylines: {
            polyline,
          }
          // simple line on map
          // {
          //   Polyline(
          //     polylineId: PolylineId('polyline'),
          //     points: [
          //       LatLng(20.3899, 78.1307),
          //       LatLng(20.3942, 78.1419),
          //     ],
          //     color: Colors.orange.shade300,
          //     width: 3,
          //     startCap: Cap.roundCap,
          //     endCap: Cap.roundCap,
          //   ),
          // },
          ),
    );
  }

  void addLine(LatLng postion) {
    polyoverLine.add(postion);

    setState(() {
      //
    });
  }
}
