import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0E33),
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff0A0E33),
        title: Text('Weather',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.menu,size: 25,color: Colors.white,),
              title: Text('    Forecast',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.map,size: 25,color: Colors.white,),
              title: Text('    Maps',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.wind_power,size: 25,color: Colors.white,),
              title: Text('    Historical Weather',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.ac_unit_rounded,size: 25,color: Colors.white,),
              title: Text('    Temprature',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.favorite,size: 25,color: Colors.white,),
              title: Text('    Favorites',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.library_books_sharp,size: 25,color: Colors.white,),
              title: Text('    News',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.feedback,size: 25,color: Colors.white,),
              title: Text('    Send Feedback',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.notifications_active,size: 25,color: Colors.white,),
              title: Text('    Notification',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.star,size: 25,color: Colors.white,),
              title: Text('    Rate Us',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff1B1F46),
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30),),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home,color: Colors.white,),
            Icon(Icons.ac_unit_sharp,color: Colors.white,),
            Icon(Icons.access_alarm,color: Colors.white,),
            Icon(Icons.person,color: Colors.white,),
          ],
        ),
      ),
    );
  }
}
