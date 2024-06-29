import 'main_model.dart';

class Weather {
  LocationModal locationModal;
  CurrentModal currentModal;
  WeatherForecast weatherForecast;

  Weather(
      {required this.locationModal,
      required this.currentModal,
      required this.weatherForecast});

  factory Weather.getData(Map json) {
    return Weather(
      locationModal: LocationModal.getData(json['location']),
      currentModal: CurrentModal.fromJson(json['current']),
      weatherForecast: WeatherForecast.fromJson(json['forecast']),
    );
  }
}

class LocationModal {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String localtime;
  final String tzId;
  final int localtimeEpoch;

  LocationModal({
    required this.tzId,
    required this.localtimeEpoch,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localtime,
  });

  factory LocationModal.getData(Map json) {
    return LocationModal(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      localtimeEpoch: json['localtime_epoch'],
      tzId: json['tz_id'],
      localtime: json['localtime'],
    );
  }
}

class CurrentModal {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double windKph;
  final double windMph;
  final int windDegree;
  final String windDir;
  final dynamic pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewPointC;
  final double dewPointF;
  final double visKm;
  final double visMiles;
  final dynamic uv;
  final double gustMph;
  final double gustKph;
  final ConditionModel conditionModel;
  final int isDay;

  CurrentModal({
    required this.isDay,
    required this.conditionModel,
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.windKph,
    required this.windMph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewPointC,
    required this.dewPointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory CurrentModal.fromJson(Map<String, dynamic> json) {
    return CurrentModal(
      conditionModel: ConditionModel.getData(json['condition']),
      lastUpdatedEpoch: json['last_updated_epoch'],
      lastUpdated: json['last_updated'],
      tempC: json['temp_c'],
      tempF: json['temp_f'],
      windKph: json['wind_kph'],
      windMph: json['wind_mph'],
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      precipMm: json['precip_mm'],
      precipIn: json['precip_in'] ?? 0.0,
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelsLikeC: json['feelslike_c'],
      feelsLikeF: json['feelslike_f'],
      windchillC: json['windchill_c'],
      windchillF: json['windchill_f'],
      heatindexC: json['heatindex_c'],
      heatindexF: json['heatindex_f'],
      dewPointC: json['dewpoint_c'],
      dewPointF: json['dewpoint_f'],
      visKm: json['vis_km'],
      visMiles: json['vis_miles'],
      uv: json['uv'],
      gustMph: json['gust_mph']?.toDouble() ?? 0.0,
      gustKph: json['gust_kph'],
      isDay: json['is_day'],
    );
  }
}

class ConditionModel {
  final String text;
  final String icon;
  final int code;

  ConditionModel({required this.text, required this.icon, required this.code});

  factory ConditionModel.getData(Map json) {
    return ConditionModel(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
