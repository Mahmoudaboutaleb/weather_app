import 'package:flutter/material.dart';
import 'package:weather_app/colors/colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: kbackgroundColor.withOpacity(0.3),
          color: kbackgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(kbackgroundColor),
          strokeWidth: 2.5,
          value: null,
        ),
      ),
    );
  }
}
