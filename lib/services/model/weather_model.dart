import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    double latitude;
    double longitude;
    double generationtimeMs;
    int utcOffsetSeconds;
    String timezone;
    String timezoneAbbreviation;
    double elevation;
    CurrentUnits currentUnits;
    Current current;
    DailyUnits dailyUnits;
    Daily daily;

    Weather({
        required this.latitude,
        required this.longitude,
        required this.generationtimeMs,
        required this.utcOffsetSeconds,
        required this.timezone,
        required this.timezoneAbbreviation,
        required this.elevation,
        required this.currentUnits,
        required this.current,
        required this.dailyUnits,
        required this.daily,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentUnits: CurrentUnits.fromJson(json["current_units"]),
        current: Current.fromJson(json["current"]),
        dailyUnits: DailyUnits.fromJson(json["daily_units"]),
        daily: Daily.fromJson(json["daily"]),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_units": currentUnits.toJson(),
        "current": current.toJson(),
        "daily_units": dailyUnits.toJson(),
        "daily": daily.toJson(),
    };
}

class Current {
    String time;
    int interval;
    double temperature2M;
    int relativeHumidity2M;
    double apparentTemperature;
    int weatherCode;
    double windSpeed10M;

    Current({
        required this.time,
        required this.interval,
        required this.temperature2M,
        required this.relativeHumidity2M,
        required this.apparentTemperature,
        required this.weatherCode,
        required this.windSpeed10M,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"]?.toDouble(),
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        weatherCode: json["weather_code"],
        windSpeed10M: json["wind_speed_10m"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "weather_code": weatherCode,
        "wind_speed_10m": windSpeed10M,
    };
}

class CurrentUnits {
    String time;
    String interval;
    String temperature2M;
    String relativeHumidity2M;
    String apparentTemperature;
    String weatherCode;
    String windSpeed10M;

    CurrentUnits({
        required this.time,
        required this.interval,
        required this.temperature2M,
        required this.relativeHumidity2M,
        required this.apparentTemperature,
        required this.weatherCode,
        required this.windSpeed10M,
    });

    factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"],
        relativeHumidity2M: json["relative_humidity_2m"],
        apparentTemperature: json["apparent_temperature"],
        weatherCode: json["weather_code"],
        windSpeed10M: json["wind_speed_10m"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "relative_humidity_2m": relativeHumidity2M,
        "apparent_temperature": apparentTemperature,
        "weather_code": weatherCode,
        "wind_speed_10m": windSpeed10M,
    };
}

class Daily {
    List<DateTime> time;
    List<int> weatherCode;
    List<double> temperature2MMax;
    List<double> windSpeed10MMax;

    Daily({
        required this.time,
        required this.weatherCode,
        required this.temperature2MMax,
        required this.windSpeed10MMax,
    });

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        weatherCode: List<int>.from(json["weather_code"].map((x) => x)),
        temperature2MMax: List<double>.from(json["temperature_2m_max"].map((x) => x?.toDouble())),
        windSpeed10MMax: List<double>.from(json["wind_speed_10m_max"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "weather_code": List<dynamic>.from(weatherCode.map((x) => x)),
        "temperature_2m_max": List<dynamic>.from(temperature2MMax.map((x) => x)),
        "wind_speed_10m_max": List<dynamic>.from(windSpeed10MMax.map((x) => x)),
    };
}

class DailyUnits {
    String time;
    String weatherCode;
    String temperature2MMax;
    String windSpeed10MMax;

    DailyUnits({
        required this.time,
        required this.weatherCode,
        required this.temperature2MMax,
        required this.windSpeed10MMax,
    });

    factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        weatherCode: json["weather_code"],
        temperature2MMax: json["temperature_2m_max"],
        windSpeed10MMax: json["wind_speed_10m_max"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "weather_code": weatherCode,
        "temperature_2m_max": temperature2MMax,
        "wind_speed_10m_max": windSpeed10MMax,
    };
}
