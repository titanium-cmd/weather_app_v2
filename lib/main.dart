import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/detailspage.dart';
import 'package:weather_app_v2/homepage.dart';

void main() {
  runApp(  
    const MyApp()
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DetailsPage(),
    );
  }
}