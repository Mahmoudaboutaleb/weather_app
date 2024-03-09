// ignore_for_file: file_names, avoid_print

// import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/cubit/get-weather/get-state.dart';
import 'package:weather_app/dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(InitWeather());
  Temperatures? weather;
  IconData icon = Icons.cloud;
  List<IconData> iconList = [Icons.sunny, Icons.sunny, Icons.sunny];
  void getWether({String loc = "Egypt"}) async {
    emit(LoadingWeather());
    try {
      weather = await WeatherDio().fetchData(loc: loc);
      switch (weather!.current.condition.text) {
        case "Mist":
          {
            kbackgroundColor = Colors.grey[100]!;
            kTextColor = const Color(0xffb597f6);
          }
        case "Partly cloudy":
          {
            kbackgroundColor = Colors.blue[100]!;
            kTextColor = Colors.blue[900]!;
            icon = CupertinoIcons.cloud_fog;
          }
        case "Light snow":
          {
            kbackgroundColor = Colors.white;
            kTextColor = const Color(0xFF28B49F);
            icon = CupertinoIcons.snow;
          }
        case "Overcast":
          {
            kbackgroundColor = Colors.grey[100]!;
            kTextColor = Colors.purple[400]!;
            icon = CupertinoIcons.cloud_fog;
          }
        case "Clear":
          {
            kbackgroundColor = const Color(0xffFAFAFA);
            kTextColor = const Color(0xff698cbf);
            icon = CupertinoIcons.cloud_sun_fill;
          }
        case "Sunny":
          {
            kbackgroundColor = Colors.yellow[100]!;
            kTextColor = const Color(0xFFEF2C00);
            icon = Icons.sunny;
          }
        case "Light rain":
          {
            kbackgroundColor = Colors.yellow[100]!;
            kTextColor = const Color(0xFF18B2A3);
            icon = CupertinoIcons.cloud_bolt_rain;
          }
        default:
          {
            kbackgroundColor = Colors.grey[100]!;
            kTextColor = const Color(0xFF8E0875);
          }
      }
      getIcon(index: 0);
      getIcon(index: 1);
      getIcon(index: 2);
      emit(SuccessWeather());
    } catch (e) {
      print('Error occurred: $e');
      emit(FailureWeather(error: e.toString()));
    }
  }

  getIcon({required int index}) {
    switch (weather!.forecast.forecastday[index].day.condition.text) {
      case "Mist":
        {
          iconList[index] = Icons.cloud;
        }
        break;
      case "Partly cloudy":
        {
          iconList[index] = CupertinoIcons.clear;
        }
        break;
      case "Light snow":
        {
          iconList[index] = CupertinoIcons.snow;
        }
        break;
      case "Overcast":
        {
          iconList[index] = CupertinoIcons.cloud_fog;
        }
        break;
      case "Clear":
        {
          icon = CupertinoIcons.wind;
        }
        break;
      case "Sunny":
        {
          iconList[index] = Icons.sunny;
        }
        break;
      default:
        {
          iconList[index] = Icons.cloud;
        }
    }
  }
}
