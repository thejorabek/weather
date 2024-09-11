import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/features/home/presentation/pages/widgets/popup/bloc/popup_bloc.dart';
import 'package:weather/services/model/weather_model.dart';

class WeatherService {
  final String baseUrl = 'https://api.open-meteo.com/v1/forecast';

  Future<Weather> getWeather(double lat, double lon, PopupBloc popupBloc) async {
    String url;
    switch (popupBloc.state.selectedItem) {
      case 'Item 1':
        url = '$baseUrl?latitude=$lat&longitude=$lon&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&daily=weather_code,temperature_2m_max,wind_speed_10m_max';
        break;
      case 'Item 2':
        url = '$baseUrl?latitude=48.8&longitude=2.34&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&daily=weather_code,temperature_2m_max,wind_speed_10m_max';
        break;
      case 'Item 3':
        url = '$baseUrl?latitude=35.6&longitude=139.8&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&daily=weather_code,temperature_2m_max,wind_speed_10m_max';
        break;
      default:
        url = '$baseUrl?latitude=$lat&longitude=$lon&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&daily=weather_code,temperature_2m_max,wind_speed_10m_max';
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ob-havo malumotlarini olishda xatolik yuz berdi');
    }
  }
}