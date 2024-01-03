import 'package:flutter/material.dart';

class NoWeatherInfo extends StatelessWidget {
  const NoWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather Start ',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'searching now',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
