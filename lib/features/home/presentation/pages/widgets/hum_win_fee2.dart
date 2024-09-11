import 'package:flutter/material.dart';
import 'package:weather/constants/image_constants.dart';
import 'package:weather/features/home/presentation/pages/widgets/hum_win_fee.dart';
import 'package:weather/services/weather/bloc/weather_state.dart';

Row humWinFee(WeatherLoaded state) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      HumWinFee(
          icon: Images.humidity,
          title: 'HUMIDITY',
          status: '${state.weatherData.current.relativeHumidity2M} %'),
      HumWinFee(
          icon: Images.wind,
          title: 'WIND',
          status: '${state.weatherData.current.windSpeed10M} km/h'),
      HumWinFee(
          icon: Images.feels,
          title: 'FEELS LIKE',
          status: '${state.weatherData.current.apparentTemperature} °'),
      
    ],
  );
}
