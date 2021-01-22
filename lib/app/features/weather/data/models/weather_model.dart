import 'package:meta/meta.dart';

import '../../domain/entities/weather.dart';

part 'constants.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    @required double lat,
    @required double lon,
    @required String name,
    @required String main,
    @required String description,
    @required double temp,
    @required double feelsLike,
    @required double tempMin,
    @required double tempMax,
    @required double humidity,
    @required double windSpeed,
    @required double windDeg,
  }) : super(
          lat: lat,
          lon: lon,
          name: name,
          main: main,
          description: description,
          temp: temp,
          feelsLike: feelsLike,
          tempMin: tempMin,
          tempMax: tempMax,
          humidity: humidity,
          windSpeed: windSpeed,
          windDeg: windDeg,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final coord = json['coord'] as Map<String, dynamic>;
    final weatherData = json['weather'][0] as Map<String, dynamic>;
    final mainData = json['main'] as Map<String, dynamic>;
    final windData = json['wind'] as Map<String, dynamic>;

    return WeatherModel(
      lat: coord[LAT_KEY] as double,
      lon: coord[LON_KEY] as double,
      name: json[NAME_KEY] as String ?? UNKNOWN,
      main: weatherData[MAIN_KEY] as String ?? UNKNOWN,
      description: weatherData[DESCRIPTION_KEY] as String ?? UNKNOWN,
      temp: mainData[TEMP_KEY] as double,
      feelsLike: mainData[FEELS_LIKE_KEY] as double,
      tempMin: mainData[TEMP_MIN_KEY] as double,
      tempMax: mainData[TEMP_MAX_KEY] as double,
      humidity: mainData[HUMIDITY_KEY] as double,
      windSpeed: windData[WIND_SPEED_KEY] as double,
      windDeg: windData[WIND_DEG_KEY] as double,
    );
  }

  factory WeatherModel.fromJsonCache(Map<String, dynamic> json) {
    return WeatherModel(
      lat: json[LAT_KEY] as double,
      lon: json[LON_KEY] as double,
      name: json[NAME_KEY] as String ?? UNKNOWN,
      main: json[MAIN_KEY] as String,
      description: json[DESCRIPTION_KEY] as String,
      temp: json[TEMP_KEY] as double,
      feelsLike: json[FEELS_LIKE_KEY] as double,
      tempMin: json[TEMP_MIN_KEY] as double,
      tempMax: json[TEMP_MAX_KEY] as double,
      humidity: json[HUMIDITY_KEY] as double,
      windSpeed: json[WIND_SPEED_KEY] as double,
      windDeg: json[WIND_DEG_KEY] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      LAT_KEY: lat,
      LON_KEY: lon,
      NAME_KEY: name,
      MAIN_KEY: main,
      DESCRIPTION_KEY: description,
      TEMP_KEY: temp,
      FEELS_LIKE_KEY: feelsLike,
      TEMP_MIN_KEY: tempMin,
      TEMP_MAX_KEY: tempMax,
      HUMIDITY_KEY: humidity,
      WIND_SPEED_KEY: windSpeed,
      WIND_DEG_KEY: windDeg,
    };
  }
}
