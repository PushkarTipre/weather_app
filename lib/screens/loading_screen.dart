import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = new Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={de7e1aadbf63a7d023e5101851ff4262}'
            as Uri);
    debugPrint(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
