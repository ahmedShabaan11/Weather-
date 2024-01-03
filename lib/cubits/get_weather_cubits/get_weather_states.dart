import 'package:weather/models/weather_model.dart';

class WeatherState{

}
class weatherInitialState extends WeatherState{

}

class WeatherLoadedState extends WeatherState {
 final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}
class WeatherFailureState extends WeatherState{

 final String erorrMessage;

  WeatherFailureState(this.erorrMessage);
}

