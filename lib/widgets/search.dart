// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/cubit/get-weather/get-cubit.dart';

class SearchText extends StatefulWidget {
  const SearchText({super.key});

  @override
  _SearchTextState createState() => _SearchTextState();
}

class _SearchTextState extends State<SearchText> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Temperatures weather = BlocProvider.of<WeatherCubit>(context).weather!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: textEditingController,
            onFieldSubmitted: (value) {
              BlocProvider.of<WeatherCubit>(context).getWether(loc: value);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              filled: true,
              hintText: 'Search...',
              fillColor: kTextColor.withOpacity(0.12),
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kTextColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kTextColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kTextColor),
              ),
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        // if (textEditingController.text != weather.location.country ||
        //     textEditingController.text != weather.location.name ||
        //     textEditingController.text.isEmpty)
        //   const ErrorPage()
      ],
    );
  }
}
