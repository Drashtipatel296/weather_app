import 'package:flutter/material.dart';
import 'package:weather_app/controller/weather_provider.dart';
import 'package:weather_app/screens/setting/setting_screen.dart';

TextEditingController txtName = TextEditingController(text: 'Surat');

class HomeScreeen extends StatelessWidget {
  const HomeScreeen({super.key, required this.weatherProvider});

  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0A0E33),
      appBar: AppBar(
        backgroundColor: const Color(0xff0A0E33),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: const Text(
          'About Today',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
        ],
      ),
      body: (weatherProvider.weather == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff1B1F46),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        onSubmitted: (value) {
                          weatherProvider.changeLocation(value);
                        },
                        controller: txtName,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          border: InputBorder.none,
                          prefixIcon: InkWell(
                            onTap: () {
                              String location = txtName.text;
                              weatherProvider.changeLocation(location);
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: weatherProvider.weather!.currentModal.isDay == 1
                              ? AssetImage('assets/img/2.webp')
                              : AssetImage('assets/img/1.png'),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      weatherProvider.weather!.currentModal.conditionModel.text,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      weatherProvider.weather!.locationModal.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${weatherProvider.weather!.currentModal.tempC.toString()} °C',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff1B1F46),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 76,
                                width: 75,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/bg2.gif'),
                                  ),
                                ),
                              ),
                               Text(
                                weatherProvider.weather!.currentModal.cloud.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Cloud',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff1B1F46),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 76,
                                width: 75,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/wind-removebg-preview (1).png'),
                                  ),
                                ),
                              ),
                              Text(
                                weatherProvider.weather!.currentModal.windKph.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                               Text(
                                'Wind',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff1B1F46),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 60,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/hum1-removebg-preview (1).png'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                               Text(
                                weatherProvider.weather!.currentModal.humidity.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Humidinity',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff1B1F46),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 76,
                                width: 75,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/uv-removebg-preview.png'),
                                  ),
                                ),
                              ),
                              Text(
                                weatherProvider.weather!.currentModal.uv.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'UV',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff1B1F46),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 76,
                                width: 75,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/bg2.gif'),
                                  ),
                                ),
                              ),
                               Text(
                                weatherProvider.weather!.locationModal.lat.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Lat',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 130,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xff1B1F46),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 76,
                                width: 75,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img/bg2.gif'),
                                  ),
                                ),
                              ),
                              Text(
                                weatherProvider.weather!.locationModal.lon.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Lon',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff1B1F46),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.ac_unit_sharp,
              color: Colors.white,
            ),
            Icon(
              Icons.access_alarm,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
