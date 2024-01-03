import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Components/WeatherInfo.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/views/search%20view.dart';

import '../Components/NoWeather Info.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App '),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is weatherInitialState) {
            return const NoWeatherInfo();
          } else if (state is WeatherLoadedState) {
            return  WeatherInfo(weather: state.weatherModel,);
          } else {
            return const Text('opps there was an erorr');
          }
        },
      ),
    );
  }
}
