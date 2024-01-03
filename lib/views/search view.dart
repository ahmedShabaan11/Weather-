import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weathe_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value)  async{
     var getWeatherCubit= BlocProvider.of<GetWeatherCubit>(context);
     getWeatherCubit.getCurrentWeather(cityName: value);
           Navigator.pop(context);
            },
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Enter City Name',
              contentPadding: const EdgeInsets.all(20),
              suffixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.red),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
