import 'dart:convert';
import 'package:weather_app_v2/model/weather_response.dart';
import 'package:http/http.dart' as http;

abstract class WeatherController {
  Future<WeatherApiResponse?> getWeather();
}

class WeatherControllerImpl implements WeatherController {

  @override
  Future<WeatherApiResponse?> getWeather() async{
    final weatherApiResponse;
    try {
      http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid=fbb6240979ac7fdf2bc3ff6dd942ae5c'));
      if(response.statusCode == 200){
        weatherApiResponse = WeatherApiResponse.fromJson(jsonDecode(response.body));
      }else{
        weatherApiResponse = null;
      }
      return weatherApiResponse;
    } catch (e) {
      return null;
    }
  }
}