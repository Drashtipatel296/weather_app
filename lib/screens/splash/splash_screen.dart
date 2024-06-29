import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/home/home_screeen.dart';

import '../../controller/weather_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProviderTrue = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff0A0E33),
      body: Padding(
        padding: const EdgeInsets.only(top: 120,left: 15),
        child: Column(
          children: [
            const Text(
              'Discover the',
              style: TextStyle(
                  color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Weather In Your City',
              style: TextStyle(
                  color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 35,),
            SizedBox(
              height: 380,
              width: 380,
              child: Image.asset('assets/img/splash.png',fit: BoxFit.cover,),
            ),
            const SizedBox(height: 35,),
            const Text(
              'Get to your weather maps and',
              style: TextStyle(
                  color: Colors.grey, fontSize: 18),
            ),
            const Text(
              'radar preciption forcast',
              style: TextStyle(
                  color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(height: 45,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HomeScreeen(weatherProvider: weatherProviderTrue,),),);
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: const Color(0xffD1841B),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text('GET STARTED',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
