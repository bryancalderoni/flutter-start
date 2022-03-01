import 'package:flutter/material.dart';
import 'package:progetto_weather/models/city_model.dart';

class CityWeather extends StatelessWidget {
  final CityModel cityModel;
  CityWeather(this.cityModel);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0, bottom: 0, left: 0, right: 0, child: backgroundImage()),
        body(),
      ],
    );
  }

  Widget backgroundImage() => Image.network(
        cityModel.backgroundImageUrl,
        fit: BoxFit.cover,
        color: Colors.black12,
        colorBlendMode: BlendMode.darken,
      );

  Widget body() => Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityModel.name,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "${cityModel.temperature}°",
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 200,
                ),
                CityWeatherList(cityModel.sevenDaysForecast),
              ],
            ),
          ),
        ),
      );
}

class CityWeatherList extends StatelessWidget {
  final List<DayForecastModel> sevenDays;
  CityWeatherList(this.sevenDays);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("7 DAY FORECAST"),
            ),
            BoxDivider(),
            Expanded(
              child: ListView.separated(
                itemCount: sevenDays.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(sevenDays[index].name),
                  trailing: Text("${sevenDays[index].temperature}°"),
                ),
                separatorBuilder: (context, index) => BoxDivider(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoxDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.white12,
    );
  }
}
