import 'package:flutter/material.dart';
import '../constants.dart' as constant2;

class MainScreen extends StatefulWidget {
  //const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: constant2.backColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * 0.1,
            child: Text(
              '${constant2.apiInstance.city}',
              style: TextStyle(
                  color: constant2.txtColor, decoration: TextDecoration.none),
            ),
          ),
          Positioned(
            top: size.height * 0.16,
            child: Text(
              '${constant2.apiInstance.date.toString()}',
              style: TextStyle(
                  color: constant2.txtColor,
                  decoration: TextDecoration.none,
                  fontSize: 30),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            child: SizedBox(
              width: size.width * 0.6,
              height: size.height * 0.23,
              child: Image.network(
                'http://openweathermap.org/img/wn/${constant2.apiInstance.icon}@2x.png',
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.6,
            child: Text(
              '${constant2.apiInstance.temp}°c',
              style: TextStyle(
                  fontSize: size.width * 0.16,
                  decoration: TextDecoration.none,
                  color: constant2.txtColor),
            ),
          ),
          Positioned(
            bottom: size.height * 0.03,
            child: Row(
              children: [
                extraInfo(
                  size: size,
                  icon: Icons.thermostat,
                  name: 'Max Temp',
                  value: '${constant2.apiInstance.maxTemp}°c',
                ),
                extraInfo(
                  size: size,
                  icon: Icons.air_outlined,
                  name: 'WIND SPEED',
                  value: '${constant2.apiInstance.airSpeed}m/s',
                ),
                extraInfo(
                  size: size,
                  icon: Icons.percent,
                  name: 'HUMIDITY',
                  value: '${constant2.apiInstance.humidity}%',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class extraInfo extends StatelessWidget {
  extraInfo({
    required this.size,
    required this.icon,
    required this.name,
    required this.value,
  });

  final Size size;
  final IconData icon;
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.3,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              color: constant2.txtColor,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            value,
            style: TextStyle(
                color: constant2.txtColor,
                fontSize: 25.0,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
