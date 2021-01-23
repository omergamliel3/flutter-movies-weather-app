import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable {
  final dynamic lat;
  final dynamic lon;
  final dynamic name;
  final dynamic main;
  final dynamic description;
  final dynamic temp;
  final dynamic feelsLike;
  final dynamic tempMin;
  final dynamic tempMax;
  final dynamic humidity;
  final dynamic windSpeed;
  final dynamic windDeg;

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
