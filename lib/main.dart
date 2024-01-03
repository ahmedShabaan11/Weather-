import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:weather/views/HomeView.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) {
            return BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                    primarySwatch: getThemeColor(
                      BlocProvider
                          .of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherStatus,
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: const HomeView(),
                );
              },
            );
          }
      ),
    );
  }


}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Partly cloudy":
      return Colors.blue;
    case "Cloudy":
      return Colors.blueGrey;
    case "Overcast":
      return Colors.grey;
    case "Mist":
      return Colors.brown;
    case "Patchy rain possible":
      return Colors.lightBlue;
    case "Patchy snow possible":
      return Colors.lightBlue;
  // Add more cases for other weather conditions
    default:
      return Colors.teal;
  }
}