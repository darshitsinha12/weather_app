import 'package:clima/constants.dart';
import 'package:clima/getloc.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  LocationPage({this.locationWeather});
  final locationWeather;
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var temp;
  var weather;
  var cityName;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(weatherData) {
    setState(() {
      temp = weatherData['main']['temp'];
      temp = temp.toInt();
      weather = weatherData['weather'][0]['main'];
      cityName = weatherData['name'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('images/download.jpeg'),
            fit: BoxFit.cover
          )
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30),
              child: Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () async {
                    var weatherData = await GetLoc().getLoc();
                    updateUI(weatherData);
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_searching,
                        size: 40,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Get Location",
                          style: kLabelTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 150),
              child: Text("$temp °C",
                  style: TextStyle(
                      fontFamily: 'Monster',
                      fontSize: 120,
                      color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, top: 300, right: 0),
              child: Text(
                "$cityName",
                style: TextStyle(
                    fontFamily: 'Monster', fontSize: 50, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Text(
                "$weather",
                style: TextStyle(
                    fontFamily: 'Monster', fontSize: 60, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// main.temp
// weather[0].main
// name
