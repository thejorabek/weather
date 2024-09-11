import 'package:weather/services/model/weather_model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final String cityName;
  final Weather weatherData;


  WeatherLoaded({required this.cityName, required this.weatherData});
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}