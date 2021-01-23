import 'package:meta/meta.dart';

import '../../domain/entities/weather.dart';

part 'constants.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    @required dynamic lat,
    @required dynamic lon,
    @required dynamic name,
    @required dynamic main,
    @required dynamic description,
    @required dynamic temp,
    @required dynamic feelsLike,
    @required dynamic tempMin,
    @required dynamic tempMax,
    @required dynamic humidity,
    @required dynamic windSpeed,
    @required dynamic windDeg,
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

    // print('cords lat ${coord[LAT_KEY].runtimeType}');
    // print('cords lon ${coord[LON_KEY].runtimeType}');
    // print('weather main ${weatherData[MAIN_KEY].runtimeType}');
    // print('weather description ${weatherData[DESCRIPTION_KEY].runtimeType}');

    // print('temp ${mainData[TEMP_KEY].runtimeType}');
    // print('feels ${mainData[FEELS_LIKE_KEY].runtimeType}');
    // print('temp min ${mainData[TEMP_MIN_KEY].runtimeType}');
    // print('temp max ${mainData[TEMP_MAX_KEY].runtimeType}');
    // print('humid ${mainData[HUMIDITY_KEY].runtimeType}');
    // print('wind speed ${windData[WIND_SPEED_KEY].runtimeType}');
    // print('wind deg ${windData[WIND_DEG_KEY].runtimeType}');

    return WeatherModel(
      lat: coord[LAT_KEY],
      lon: coord[LON_KEY],
      name: json[NAME_KEY] ?? UNKNOWN,
      main: weatherData[MAIN_KEY] ?? UNKNOWN,
      description: weatherData[DESCRIPTION_KEY] ?? UNKNOWN,
      temp: mainData[TEMP_KEY],
      feelsLike: mainData[FEELS_LIKE_KEY],
      tempMin: mainData[TEMP_MIN_KEY],
      tempMax: mainData[TEMP_MAX_KEY],
      humidity: mainData[HUMIDITY_KEY],
      windSpeed: windData[WIND_SPEED_KEY],
      windDeg: windData[WIND_DEG_KEY],
    );
  }

  factory WeatherModel.fromJsonCache(Map<String, dynamic> json) {
    return WeatherModel(
      lat: json[LAT_KEY],
      lon: json[LON_KEY],
      name: json[NAME_KEY] ?? UNKNOWN,
      main: json[MAIN_KEY],
      description: json[DESCRIPTION_KEY],
      temp: json[TEMP_KEY],
      feelsLike: json[FEELS_LIKE_KEY],
      tempMin: json[TEMP_MIN_KEY],
      tempMax: json[TEMP_MAX_KEY],
      humidity: json[HUMIDITY_KEY],
      windSpeed: json[WIND_SPEED_KEY],
      windDeg: json[WIND_DEG_KEY],
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
