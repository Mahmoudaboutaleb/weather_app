// ignore_for_file: file_names

class WeatherState {}

class InitWeather extends WeatherState {}

class LoadingWeather extends WeatherState {}

class SuccessWeather extends WeatherState {}

class FailureWeather extends WeatherState {
  FailureWeather({required String error});
}
