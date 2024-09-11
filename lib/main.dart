import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/app.dart';
import 'package:weather/features/home/presentation/pages/widgets/popup/bloc/popup_bloc.dart';
import 'package:weather/services/location/bloc/location_bloc.dart';
import 'package:weather/services/weather/bloc/weather_bloc.dart';
import 'package:weather/services/weather/bloc/weather_event.dart';
import 'package:weather/services/weather/weather_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc(),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => PopupBloc()),
        BlocProvider(
          create: (context) => WeatherBloc(
            WeatherService(),
            context.read<PopupBloc>(),
          )..add(GetWeatherForCurrentLocation()),
        ),
      ], child: const App()),
    );
  }
}
