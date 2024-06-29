import 'dart:convert';
import 'package:flutter/material.dart';
import '../model/weather_model.dart';
import '../services/weather_api.dart';


class WeatherProvider extends ChangeNotifier {
  Weather? weather;
  bool isLoading = false;
  String location = "Surat";

  WeatherProvider() {
    fetchData(location);
  }

  Future<void> fetchData(String location) async {

    isLoading = true;
    notifyListeners();

    String? jsonData = await ApiServices.apiServices.apiCalling(location);

    if (jsonData != null) {
      Map dataList = jsonDecode(jsonData);
      weather = Weather.getData(dataList);

      isLoading = false;
      notifyListeners();
    }
  }

  void changeLocation(String newLocation)
  {
    location = newLocation;
    notifyListeners();
    fetchData(location);
  }
}
