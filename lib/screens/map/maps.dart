import 'package:flutter/material.dart';
import 'package:google_maps_controller/google_maps_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:green_wallet/constants.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:green_wallet/models/green_box.dart';

class Maps extends StatefulWidget {
  const Maps({Key key, this.listBox}) : super(key: key);
  final List<GreenBox> listBox;
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  //Future<void> initState() {
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    //_getCurrentLocation();
    Future.microtask(() async => await _getCurrentLocation());
    Set<Marker> listMarkers = {};
    print("rriiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiirrr,${listBox.length}");
    for (int i = 0; i < listBox.length; i++) {
      GreenBox centre = (listBox)[i];
      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(centre.nom);
      listMarkers.add(
        Marker(
            markerId: MarkerId(centre.id),
            //position: LatLng(centre.location["position"]["_lat"], centre.location["position"]["_long"]),
            position: LatLng(4.0004737, 9.8057055),
            infoWindow: InfoWindow(
              title: centre.nom,
              //snippet: centre.tel,
            ),
            icon: BitmapDescriptor.defaultMarker,
            zIndex: 0,
            onTap: () {
              this.setState(() {
                // _destinationPosition = Position(timestamp: null, latitude:centre.location["position"]["_lat"], longitude:  centre.location["position"]["_long"], speed:0, heading:0, accuracy: 0, speedAccuracy: 0, altitude: 0);
                _destinationPosition = Position(
                    timestamp: null,
                    latitude: 4.0476624,
                    longitude: 9.693887,
                    speed: 0,
                    heading: 0,
                    accuracy: 0,
                    speedAccuracy: 0,
                    altitude: 0);
              });
              print(
                  '${_destinationPosition.latitude}, ${_destinationPosition.longitude}*************');
            }),
      );
    }
    this.setState(() {
      markers = listMarkers;
    });
  }

  BitmapDescriptor pinLocationIcon;
  GoogleMapController mapController;

  Position _currentPosition = Position(
      timestamp: null,
      latitude: 4.04,
      longitude: 9.67,
      speed: 0,
      heading: 0,
      accuracy: 0,
      speedAccuracy: 0,
      altitude: 0);
  Position _destinationPosition;

  String _placeDistance;
  Set<Marker> markers;
  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  // Method for retrieving the current location
  _getCurrentLocation() async {
    print(
        '*************************Je suis dans Current Location*********************************');
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _destinationPosition = position;
        _currentPosition = position;
        print(
            '********************CURRENT POS: $_currentPosition ****************************');
      });
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 10.0,
          ),
        ),
      );
    }).catchError((e) {
      print(e);
    });
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    print(
        '*************************Je suis dans Calculator distance*********************************');
    try {
      double startLatitude = _currentPosition.latitude;
      double startLongitude = _currentPosition.longitude;
      double destinationLatitude = _destinationPosition.latitude;
      double destinationLongitude = _destinationPosition.longitude;

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      print(
          "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print('$miny,$minx,$maxy,$maxx');
      // Accommodate the two locations within the
      // camera view of the map
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      print(
          'mmmmmmmooooooooooooooooooooooooooooo ${polylineCoordinates.length}');
      for (int i = 0; i < polylineCoordinates.length - 2; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        _placeDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $_placeDistance km');
      });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    print(
        'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $startLatitude,$startLongitude,$destinationLatitude,$destinationLongitude');
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyCsqo7HFrCLRwDYfdoOmgEMVKdRKdrJUvs', // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.driving,
    );
    /* PolylineResult result = await polylinePoints.getRouteBetweenCoordinates('AIzaSyB2gRtnm_h3PmxB6ZhZ1ZBpvwAYiQheb1Y',
        startLatitude, startLongitude, destinationLatitude, destinationLongitude); */
    print(result.points);
    if (result.points.isNotEmpty) {
      print('juiioookkkkkkkkkkkkkkppppppppppppppppppppppkkk');
      result.points.forEach((PointLatLng point) {
        print(
            '$point.latitude,$point.longitude*************result.points.isNotEmpty*************');
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    Map<PolylineId, Polyline> polylines1 = {};
    polylines1[id] = polyline;
    this.setState(() {
      polylines = polylines1;
    });
  }

  void setCustomMapPin() async {
    BitmapDescriptor pinLocationIcon1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/icons/bell.svg');
    //'assets/images/marker-icon-green.png');
    this.setState(() {
      pinLocationIcon = pinLocationIcon1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      _currentPosition.latitude, _currentPosition.longitude),
                  zoom: 10),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
            // Show zoom buttons
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.blue.shade100, // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.add),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: Colors.blue.shade100, // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.remove),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Show the place input fields & button for
            // showing the route
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Green Box',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.blueAccent),
                          ),
                          SizedBox(height: 10),
                          Visibility(
                            visible: _placeDistance == null ? false : true,
                            child: Text(
                              'DISTANCE: $_placeDistance km',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: (_currentPosition !=
                                    _destinationPosition)
                                ? () async {
                                    setState(() {
                                      if (polylines.isNotEmpty)
                                        polylines.clear();
                                      if (polylineCoordinates.isNotEmpty)
                                        polylineCoordinates.clear();
                                      _placeDistance = null;
                                    });

                                    _calculateDistance().then((isCalculated) {
                                      if (isCalculated) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Distance Calculated Sucessfully'),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Erreur de calcul de la route'),
                                          ),
                                        );
                                      }
                                    });
                                  }
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Obtenir Itinéraire'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Show current location button
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                  child: ClipOval(
                    child: Material(
                      color: Colors.orange.shade100, // button color
                      child: InkWell(
                        splashColor: Colors.orange, // inkwell color
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Icon(Icons.my_location),
                        ),
                        onTap: () {
                          mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                  _currentPosition.latitude,
                                  _currentPosition.longitude,
                                ),
                                zoom: 12.0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
