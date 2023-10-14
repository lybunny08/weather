import 'package:flutter/material.dart';

class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_dir;
  var gust;
  var uv;
  var pressure;
  var precipe;
  var last_updated;

  Weather(
      {required this.cityName,
      required this.condition,
      required this.gust,
      required this.humidity,
      required this.icon,
      required this.last_updated,
      required this.pressure,
      required this.precipe,
      required this.temp,
      required this.uv,
      required this.wind,
      required this.wind_dir});
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    icon = json['current']['condition']['icon'];
    condition = json['current']['condition']['text'];
    temp = json['current']['temp_c'];
    wind = json['current']['wind_kph'];
    humidity = json['current']['humidity'];
    wind_dir = json['current']['wind_dir'];
    pressure = json['current']['pressure'];
    precipe = json['current']['precip_mm'];
    last_updated = json['current']['last_updated'];
    gust = json['current']['gust_kph'];
    uv = json['current']['uv'];
  }
  String get lastUpdate => last_updated; // Ajout du getter lastUpdated
}
