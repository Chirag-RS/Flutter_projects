import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/helpers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
     title: "Weather App",
      home: MyHomePage(),
      )
);

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/3,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "Currently in Bangalore",
                   style: textStyle('text'),
                  )
                ),
                Text(
                  "52\u00B0",
                  style: textStyle("Summer"),
                ),
                Padding(
                    padding:EdgeInsets.only(top: 30.0),
                    child: Text(
                      "",
                      style: textStyle('text'),
                    ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("Temperature"),
                    trailing: Text("30\u00B0"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("Weather"),
                    trailing: Text("30\u00B0"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.cloudRain),
                    title: Text("Rainfall"),
                    trailing: Text("30\u00B0"),
                  ),

                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("Temperature"),
                    trailing: Text("30\u00B0"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
