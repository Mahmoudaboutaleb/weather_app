// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:weather_app/colors/colors.dart';
import 'package:weather_app/widgets/card-item.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CardItem(
          index: 0,
        ),
        Container(
          width: 2,
          height: 100,
          decoration: BoxDecoration(color: kTextColor),
        ),
        CardItem(
          index: 1,
        ),
        Container(
          width: 2,
          height: 100,
          decoration: BoxDecoration(color: kTextColor),
        ),
        CardItem(
          index: 2,
        ),
      ],
    );
  }
}
