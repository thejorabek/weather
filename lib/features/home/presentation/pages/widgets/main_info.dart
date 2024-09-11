import 'package:flutter/material.dart';
import 'package:weather/core/code/weather_code.dart';
import 'package:weather/services/weather/bloc/weather_state.dart';

Column mainInfo(BuildContext context, WeatherLoaded state) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .04),
        Text(
          getWeatherDescription(state.weatherData.current.weatherCode),
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    '${state.weatherData.current.temperature2M.toInt()}', 
                style: const TextStyle(
                  fontSize: 90, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(5, -35),
                  child: const Text(
                    '°C',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .03),
      ],
    );
  }