import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get-weather/get-cubit.dart';
import 'package:weather_app/HomePage.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return WeatherCubit();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        title: 'Weather',
        theme: ThemeData(
          useMaterial3: true,
          
        ),
        home: const HomePage(),
      ),
    );
  }
}
