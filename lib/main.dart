import 'package:eticon_api/eticon_api.dart';
import 'package:eticon_nasa/models/apod_model.dart';
import 'package:eticon_nasa/screens/main_screen/main_screen_provider.dart';
import 'package:flutter/material.dart';

void main(){
  Api.init(baseUrl: 'https://api.nasa.gov/');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreenProvider(),
    );
  }
}

