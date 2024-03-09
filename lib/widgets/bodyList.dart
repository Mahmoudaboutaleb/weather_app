// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/cubit/get-weather/get-cubit.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widgets/card-widget.dart';
import 'package:weather_app/widgets/search.dart';

class BodyList extends StatelessWidget {
  const BodyList({super.key});

  @override
  Widget build(BuildContext context) {
    Temperatures weather = BlocProvider.of<WeatherCubit>(context).weather!;
    IconData iconData = BlocProvider.of<WeatherCubit>(context).icon;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            weather.location.country,
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.w500, color: kTextColor),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchText(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 20, bottom: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Icon(
                        Icons.location_on,
                        color: kTextColor,
                        size: 45,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            weather.location.name,
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          weather.location.country,
                          style: TextStyle(color: kTextColor, fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          weather.current.condition.text,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                              color: kTextColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: kTextColor.withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(-1, 1),
                                )
                              ]),
                          child: Center(
                            child: Text(weather.current.tempC.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: kTextColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Icon(
                      iconData,
                      size: 65,
                      color: kTextColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 52,
              ),
              const CardWidget(),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
