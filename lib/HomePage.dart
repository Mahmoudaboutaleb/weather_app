// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get-weather/get-cubit.dart';
import 'package:weather_app/cubit/get-weather/get-state.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widgets/bodyList.dart';
import 'package:weather_app/widgets/errorWidget.dart';
import 'package:weather_app/widgets/loding.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Temperatures? weather;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getWether();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is LoadingWeather) {
          return const LoadingWidget();
        } else if (state is SuccessWeather) {
          return const BodyList();
        } else {
          return const ErrorPage();
        }
      },
    );
  }
}
