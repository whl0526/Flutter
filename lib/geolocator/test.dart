import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NativePluginWidgetState();
  }
}
class NativePluginWidgetState extends State<NativePluginWidget>{
  String? latitude;
  String? longitude;

  getGeoData() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('permisson are denied');
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();

    });
  }
  @override
  void initState() {
    super.initState();
    getGeoData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Geolocator'),),
        body: Container(
        color: Colors.purple,
        child:Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
        'My Location'
    ),
    Text(
    'latitude : ${latitude}'
    ),
    Text(
    'longtitude : ${longitude}'
    ),
      ],
    ),
    ),
    ),
    );
  }
}


