import 'package:flutter/material.dart';

import '../../../../core/widgets/index.dart';
import '../../../weather/domain/entities/weather.dart';

const DAYS_OF_WEEK = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

class WeatherWidget extends StatelessWidget {
  final Weather weather;
  const WeatherWidget(this.weather);
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 22);
    const bold = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
    final currentDay = DateTime.now().weekday - 1;

    return KeepAliveWrapper(
      child: Center(
        child: Card(
          color: Colors.cyan,
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // location and temp row
                Row(
                  children: [
                    const Icon(Icons.place),
                    Text(
                      ' ${weather.name}',
                      style: style,
                    ),
                    const Spacer(),
                    Text(
                      '${weather.temp}\u00b0',
                      style: bold,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // weather description row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_rounded),
                    Text(
                      '   ${weather.description}',
                      style: bold,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // feels like and humidity row
                Row(
                  children: [
                    Text(
                      'FEELS LIKE:\n${weather.feelsLike}\u00b0',
                      style: style,
                    ),
                    const Spacer(),
                    Text(
                      'HUMITIDY:\n${weather.humidity}',
                      style: style,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                // days of week row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List<Widget>.generate(
                      7,
                      (index) => Container(
                            height: 50,
                            width: 50,
                            child: Card(
                              color: currentDay == index
                                  ? null
                                  : Colors.transparent,
                              child: Center(
                                child: Text(
                                  DAYS_OF_WEEK[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
