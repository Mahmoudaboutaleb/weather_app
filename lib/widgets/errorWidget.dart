// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:weather_app/widgets/search.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Error",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            SearchText(),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                'Something went wrong \n Try again',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEB6359),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
