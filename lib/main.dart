import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home/home_screeen.dart';

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

    WeatherProvider weatherProviderTrue = Provider.of<WeatherProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreeen(weatherProvider: weatherProviderTrue,),
    );
  }
}
