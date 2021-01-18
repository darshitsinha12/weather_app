import 'package:clima/constants.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'getdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'locationpage.dart';
import 'getloc.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double lattitude;
  double longitude;
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    GetLoc loc = GetLoc();
    var decodedData = await loc.getLoc();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationPage(
        locationWeather: decodedData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/download.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(100),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 50),
                  child: SpinKitFadingCube(
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
                  child: Text(
                    "Getting location data please wait . . . . ",
                    style: kLabelTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
