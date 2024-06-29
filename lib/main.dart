import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/splash/splash_screen.dart';

import 'controller/weather_provider.dart';


void main(){
  runApp(
    ChangeNotifierProvider(create: (context) => WeatherProvider(),
     child: const WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
