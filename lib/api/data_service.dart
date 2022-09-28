import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models.dart';

class DataService{
  Future<WeatherResponse> getWeather() async{

    final queryParameters = {'q' : 'Nukus', 'appid' : '4f9e6a3bedd2e51c200539b265d0f8ef', 'units' : 'metric'};

    final uri = Uri.http('api.openweathermap.org', 'data/2.5/weather', queryParameters);

    final response = await http.get(Uri.parse(uri.toString()));


    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}

class DataServiceWeekDetails{
  Future<WeatherWeekDetails> getWeatherWeek() async{
    final queryParameters = {'q' : 'Nukus', 'appid' : '4f9e6a3bedd2e51c200539b265d0f8ef', 'units' : 'metric', 'cnt' : '8'};

    final uri = Uri.http('api.openweathermap.org', 'data/2.5/forecast', queryParameters);

    final response = await http.get(Uri.parse(uri.toString()));



    final json = jsonDecode(response.body);
    return WeatherWeekDetails.fromJson(json);
  }
}