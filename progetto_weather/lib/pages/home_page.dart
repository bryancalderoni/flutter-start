import 'package:flutter/material.dart';
import 'package:progetto_weather/components/city_weather.dart';
import 'package:progetto_weather/models/city_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body());
  }

  Widget body() => PageView.builder(
      itemCount: weatherData.length,
      itemBuilder: (context, index) => CityWeather(weatherData[index]));
}
