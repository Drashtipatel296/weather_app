import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/home_screeen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 130,left: 15),
        child: Column(
          children: [
            Text(
              'Discover the',
              style: TextStyle(
                  color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
            ),
            Text(
              'Weather In Your City',
              style: TextStyle(
                  color: Colors.white, fontSize: 33, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30,),
            Container(
              height: 380,
              width: 380,
              child: Image.asset('assets/img/splash.png',fit: BoxFit.cover,),
            ),
            SizedBox(height: 30,),
            Text(
              'Get to your weather maps and',
              style: TextStyle(
                  color: Colors.grey, fontSize: 18),
            ),
            Text(
              'radar preciption forcast',
              style: TextStyle(
                  color: Colors.grey, fontSize: 18),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen(),),);
              },
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xffD1841B),
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: Text('GET STARTED',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
