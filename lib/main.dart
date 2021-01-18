import 'package:flutter/material.dart';
import 'constants.dart';
import 'landingpage.dart';

void main() {
  return (
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    home: Scaffold(
      appBar: AppBar(
      title: Text("Clima",
      style: kLabelTextStyle,
      ),
      centerTitle: true,
      ),
      body: LandingPage(),
    ),
  )));
}