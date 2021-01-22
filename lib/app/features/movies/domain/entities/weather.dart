import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather extends Equatable {
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
  List<Object> get props => [];
}
