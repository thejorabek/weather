import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/features/home/presentation/pages/widgets/popup/bloc/popup_bloc.dart';
import 'package:weather/services/weather/bloc/weather_event.dart';
import 'package:weather/services/weather/bloc/weather_state.dart';
import 'package:weather/services/weather/weather_service.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;
  final PopupBloc popupBloc;

  WeatherBloc(this.weatherService, this.popupBloc) : super(WeatherInitial()) {
    on<GetWeatherForCurrentLocation>((event, emit) async {
      emit(WeatherLoading());
      try {
        final position = await _determinePosition();
        final weatherData = await weatherService.getWeather(
          position.latitude,
          position.longitude,
          popupBloc,
        );
        final cityName = await _getCityName(position);
        emit(WeatherLoaded(weatherData: weatherData, cityName: cityName));
      } catch (e) {
        emit(WeatherError(message: e.toString()));
      }
    });

    on<GetWeatherForSelectedLocation>((event, emit) async {
      final position = await _determinePosition();
      final cityName2 = await _getCityName(position);
      emit(WeatherLoading());
      try {
        final weatherData = await weatherService.getWeather(0, 0, popupBloc);
        String cityName;
        switch (popupBloc.state.selectedItem) {
          case 'Item 1':
            cityName = cityName2;
            break;
          case 'Item 2':
            cityName = 'Paris';
            break;
          case 'Item 3':
            cityName = 'Tokyo';
            break;
          default:
            cityName = 'Unknown';
        }
        emit(WeatherLoaded(weatherData: weatherData, cityName: cityName));
      } catch (e) {
        emit(WeatherError(message: e.toString()));
      }
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<String> _getCityName(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      return placemarks[0].locality ?? 'Unknown';
    }
    return 'Unknown';
  }
}
