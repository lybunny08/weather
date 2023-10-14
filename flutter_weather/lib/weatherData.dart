import 'dart:convert';

import 'package:flutter_weather/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=3d27f8d5eef14adc96b75814231706&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
