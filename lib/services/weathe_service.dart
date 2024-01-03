import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'e463019e7bc247efae3142518232712';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String erorrMessage = e.response?.data['error']['message'] ??
          'oops there was an error ,try  later ';
      throw Exception(erorrMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('try later');
    }
  }
}
