import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import '../services/weather_api.dart';

class WeatherProvider extends ChangeNotifier{
  String location = "surat";
  WeatherModel? weathermodel;

  Future<WeatherModel?> weatherJsonParsing(String location)
  async {
    weathermodel = await WeatherApiHelper().weatherApiCalling(location);
    return weathermodel;
    notifyListeners();
  }

  void changeLocation(String newLocation)
  {
    location = newLocation;
    notifyListeners();
    weatherJsonParsing(newLocation);
  }
}