import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/weather_provider.dart';
import '../../model/weather_model.dart';

TextEditingController txtLocation = TextEditingController(text: "surat");

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    WeatherProvider weatherProviderTrue = Provider.of(context, listen: true);
    WeatherProvider weatherProviderFalse = Provider.of(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: weatherProviderFalse
            .weatherJsonParsing(weatherProviderTrue.location),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            WeatherModel? weatherData = snapshot.data as WeatherModel?;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: weatherData!.current!.isDay == 1
                            ? AssetImage('assets/img/day.gif')
                            : AssetImage('assets/img/back.gif'),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 65, left: 10, right: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            width: 440,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xff292E36),
                            ),
                            alignment: Alignment.center,
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: txtLocation,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(15),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    String location = txtLocation.text;
                                    weatherProviderFalse.changeLocation(location);
                                  },
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (value) {
                                weatherProviderFalse.changeLocation(value);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Consumer<WeatherProvider>(
                            builder: (context, provider, child) {
                              if (provider.weathermodel == null) {
                                return CircularProgressIndicator();
                              }
                              WeatherModel weatherData = provider.weathermodel!;
                              return Column(
                                children: [
                                  Text(
                                    weatherData.location!.location.toString(),
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${weatherData.current?.tempC}°',
                                    style: TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '${weatherData.current!.condition!.text}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 280,
                                    width: 280,
                                    child: Image.asset(
                                      'assets/img/bg2.gif',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Text(
                                        'Hourly Forecast',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Weekly Forecast',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 180,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text(
                                              '12 PM',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/img/2.webp'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              '12',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        height: 180,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text(
                                              '12 PM',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/img/2.webp'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              '12',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        height: 180,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text(
                                              '12 PM',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/img/2.webp'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              '12',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        height: 180,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text(
                                              '12 PM',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/img/2.webp'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              '12',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        height: 180,
                                        width: 56,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text(
                                              '12 PM',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/img/2.webp'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              '12',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Container(
                                        height: 180,
                                        width: 55,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            const Text(
                                              '12 PM',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 13,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      'assets/img/2.webp'),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              '12',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
