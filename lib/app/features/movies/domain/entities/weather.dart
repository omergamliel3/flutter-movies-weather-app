import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable {
  final double lat;
  final double lon;
  final String name;
  final String main;
  final String description;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final double humidity;
  final double windSpeed;
  final double windDeg;

  const Weather({
    @required this.lat,
    @required this.lon,
    @required this.name,
    @required this.main,
    @required this.description,
    @required this.temp,
    @required this.feelsLike,
    @required this.tempMin,
    @required this.tempMax,
    @required this.humidity,
    @required this.windSpeed,
    @required this.windDeg,
  });
  @override
  List<Object> get props => [
        lat,
        lon,
        name,
        main,
        description,
        temp,
        feelsLike,
        tempMin,
        tempMax,
        humidity,
        windSpeed,
        windDeg,
      ];
}
