import 'package:flutter/material.dart';
import 'package:havadurumu/screens/loading_screen.dart';
import 'package:havadurumu/screens/main_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), //koyu mod kullanacağız...
      home:LoadingScreen(),


      );

  }
}

