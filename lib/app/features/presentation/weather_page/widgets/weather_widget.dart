import 'package:flutter/material.dart';
import 'package:prospera_exercise/app/features/weather/domain/entities/weather.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  const WeatherWidget(this.weather);
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 25);
    return Center(
      child: Card(
        elevation: 4.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Weather: ${weather.main}',
                style: style,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Desc: ${weather.description}',
                style: style,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Temp: ${weather.temp}',
                style: style,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Humidity: ${weather.humidity}',
                style: style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
