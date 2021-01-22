import 'package:meta/meta.dart';

import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
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
    final weatherData = json['weather'][0] as Map<String, dynamic>;
    final mainData = json['main'] as Map<String, dynamic>;
    final windData = json['wind'] as Map<String, dynamic>;

    return WeatherModel(
      main: weatherData['main'] as String,
      description: weatherData['description'] as String,
      temp: mainData['temp'] as double,
      feelsLike: mainData['feels_like'] as double,
      tempMin: mainData['temp_min'] as double,
      tempMax: mainData['temp_max'] as double,
      humidity: mainData['humidity'] as double,
      windSpeed: windData['speed'] as double,
      windDeg: windData['deg'] as double,
    );
  }

  factory WeatherModel.fromJsonCache(Map<String, dynamic> json) {
    return WeatherModel(
      main: json['main'] as String,
      description: json['description'] as String,
      temp: json['temp'] as double,
      feelsLike: json['feels_like'] as double,
      tempMin: json['temp_min'] as double,
      tempMax: json['temp_max'] as double,
      humidity: json['humidity'] as double,
      windSpeed: json['speed'] as double,
      windDeg: json['deg'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "main": main,
      "description": description,
      "temp": temp,
      "feels_like": feelsLike,
      "temp_min": tempMin,
      "temp_max": tempMax,
      "humidity": humidity,
      "speed": windSpeed,
      "deg": windDeg,
    };
  }
}
