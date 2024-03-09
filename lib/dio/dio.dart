import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherDio {
  final dio = Dio();

  Future<Temperatures> fetchData({required String loc}) async {
    var response = await dio.get(
      "https://api.weatherapi.com/v1/forecast.json",
      queryParameters: {
        'key': 'fd0cc7a1d4244872be0225652240702',
        'q': loc,
        'aqi': 'no',
        'days': 3,
      },
    );
    // WeatherModel model = WeatherModel.fromJson(response.data);
    Temperatures weather = Temperatures.fromJson(response.data);
    return weather;
  }
}
