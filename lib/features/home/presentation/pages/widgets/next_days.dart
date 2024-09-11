import 'package:flutter/material.dart';
import 'package:weather/core/code/date_time_code.dart';
import 'package:weather/core/code/weather_code.dart';
import 'package:weather/features/home/presentation/pages/widgets/weather_day.dart';
import 'package:weather/services/weather/bloc/weather_state.dart';

Container nextDays(BuildContext context, WeatherLoaded state) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.sizeOf(context).width * 1,
        height: MediaQuery.sizeOf(context).height * .18,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            weatherDay(
                "${getDayOfWeek(state.weatherData.daily.time[1].toString())} ${state.weatherData.daily.time[1].day}",
                getIcon(state.weatherData.daily.weatherCode[1], 30),
                "${state.weatherData.daily.temperature2MMax[1]}°",
                "${state.weatherData.daily.windSpeed10MMax[1]}\nkm/h"),
            weatherDay(
                "${getDayOfWeek(state.weatherData.daily.time[2].toString())} ${state.weatherData.daily.time[2].day}",
                getIcon(state.weatherData.daily.weatherCode[2], 30),
                "${state.weatherData.daily.temperature2MMax[2]}°",
                "${state.weatherData.daily.windSpeed10MMax[2]}\nkm/h"),
            weatherDay(
                "${getDayOfWeek(state.weatherData.daily.time[3].toString())} ${state.weatherData.daily.time[3].day}",
                getIcon(state.weatherData.daily.weatherCode[3], 30),
                "${state.weatherData.daily.temperature2MMax[3]}°",
                "${state.weatherData.daily.windSpeed10MMax[3]}\nkm/h"),
            weatherDay(
                "${getDayOfWeek(state.weatherData.daily.time[4].toString())} ${state.weatherData.daily.time[4].day}",
                getIcon(state.weatherData.daily.weatherCode[4], 30),
                "${state.weatherData.daily.temperature2MMax[4]}°",
                "${state.weatherData.daily.windSpeed10MMax[4]}\nkm/h"),
          ],
        ));
  }