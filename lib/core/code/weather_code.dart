import 'package:flutter/material.dart';

enum WeatherCondition {
  clearSky,
  mainlyClear,
  partlyCloudy,
  overcast,
  fog,
  depositingRimeFog,
  drizzleLight,
  drizzleModerate,
  drizzleDense,
  freezingDrizzleLight,
  freezingDrizzleDense,
  rainSlight,
  rainModerate,
  rainHeavy,
  freezingRainLight,
  freezingRainHeavy,
  snowfallSlight,
  snowfallModerate,
  snowfallHeavy,
  snowGrains,
  rainShowerSlight,
  rainShowerModerate,
  rainShowerViolent,
  snowShowerSlight,
  snowShowerHeavy,
  thunderstormSlight,
  thunderstormWithHailSlight,
  thunderstormWithHailHeavy,
  unknown,
}

String getWeatherDescription(int code) {
  switch (code) {
    case 0:
      return 'Clear sky';
    case 1:
    case 2:
    case 3:
      return 'Partly cloudy';
    case 45:
    case 48:
      return 'Fog';
    case 51:
    case 53:
    case 55:
      return 'Drizzle';
    case 56:
    case 57:
      return 'Freezing Drizzle';
    case 61:
    case 63:
    case 65:
      return 'Rain';
    case 66:
    case 67:
      return 'Freezing Rainy';
    case 71:
    case 73:
    case 75:
      return 'Snow fall';
    case 77:
      return 'Snow grains';
    case 80:
    case 81:
    case 82:
      return 'Rain showers';
    case 85:
    case 86:
      return 'Snow showers';
    case 95:
      return 'Thunderstorm';
    case 96:
    case 99:
      return 'Thunderstorm';
    default:
      return 'Unknown weather condition';
  }
}

Icon getIcon(int code, double size) {
  switch (code) {
    case 0:
      return Icon(Icons.wb_sunny_rounded, color: Colors.amber, size: size);
    case 1:
    case 2:
    case 3:
      return Icon(Icons.wb_cloudy, size: size, color: Colors.white);
    case 45:
    case 48:
      return Icon(Icons.foggy, size: size, color: Colors.white);
    case 51:
    case 53:
    case 55:
      return Icon(Icons.cloudy_snowing, size: size, color: Colors.white);
    case 56:
    case 57:
      return Icon(Icons.cloudy_snowing, size: size, color: Colors.white);
    case 61:
    case 63:
    case 65:
      return Icon(Icons.cloudy_snowing, size: size, color: Colors.white);
    case 66:
    case 67:
      return Icon(Icons.cloudy_snowing, size: size, color: Colors.white);
    case 71:
    case 73:
    case 75:
      return Icon(Icons.snowing, size: size, color: Colors.white);
    case 77:
      return Icon(Icons.cloudy_snowing, size: size, color: Colors.white);

    case 80:
    case 81:
    case 82:
      return Icon(Icons.cloudy_snowing, size: size, color: Colors.white);

    case 85:
    case 86:
      return Icon(Icons.snowing, size: size, color: Colors.white);

    case 95:
      return Icon(Icons.thunderstorm_sharp, size: size, color: Colors.white);

    case 96:
    case 99:
      return Icon(Icons.thunderstorm_rounded, size: size, color: Colors.white);
    default:
      return Icon(Icons.do_not_disturb_alt_sharp,
          size: size, color: Colors.white);
  }
}
