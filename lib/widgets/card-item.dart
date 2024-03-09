// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/cubit/get-weather/get-cubit.dart';
import 'package:weather_app/model/weather_model.dart';

class CardItem extends StatefulWidget {
  CardItem({required this.index, super.key});
  int index;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    Temperatures weather = BlocProvider.of<WeatherCubit>(context).weather!;
    List<IconData> iconWeather = BlocProvider.of<WeatherCubit>(context).iconList;

    return Container(
      width: 90,
      decoration: BoxDecoration(
        color: kbackgroundColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: kTextColor.withOpacity(0.13),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    DateFormat("E - d").format(DateTime.parse(weather
                        .forecast.forecastday[widget.index].date
                        .toString())),
                    style: TextStyle(fontSize: 14, color: kTextColor)),
                const SizedBox(
                  height: 3,
                ),
                Text(
                    weather
                        .forecast.forecastday[widget.index].day.condition.text,
                    style: TextStyle(
                        fontSize: 14,
                        color: kTextColor,
                        overflow: TextOverflow.ellipsis)),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Icon(
              iconWeather[widget.index],
              color: kTextColor,
              size: 45,
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
                weather.forecast.forecastday[widget.index].day.avgtempC
                    .toString(),
                style: TextStyle(fontSize: 14, color: kTextColor)),
          ],
        ),
      ),
    );
  }
}
