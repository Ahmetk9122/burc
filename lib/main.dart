import 'package:burc/burc_listesi.dart';
import 'package:burc/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
     onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}