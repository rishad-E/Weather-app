import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_scnd/model/model.dart';

class WeatherServices {
  Future<Weather?> getData(var latitude, var longitude) async {
    final baseUrl = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=c870d1c7238a476183f54721232106&q=$latitude,$longitude&aqi=no');
    try {
      final response = await http.get(baseUrl);
      final body = jsonDecode(response.body);
      return Weather.fromJson(body);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
