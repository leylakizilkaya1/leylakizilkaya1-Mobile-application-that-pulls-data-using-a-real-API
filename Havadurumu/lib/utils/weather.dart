
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

import 'location.dart';

const apiKey="a848d1ac3484de975923e7e97d73c12e";

class WeatherDisplayData{
  Icon weatherIcon;
  AssetImage weatherImage;

  WeatherDisplayData({required this.weatherIcon,required this.weatherImage});
}


 class WeatherData{
  WeatherData({required this.locationData});

  LocationHelper locationData;
  late double currentTemperature;
  late int currentCondition;
  late String city;


  Future<void> getCurrentTemperature() async {
    Uri uri= Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&appid=${apiKey}&units=metric"  );
    Response response = await get(uri);

    if (response.statusCode == 200) {
      String data = response.body;
      var currentWeather = jsonDecode(data);

      try {
        currentTemperature = currentWeather['main']['temp'];
        currentCondition = currentWeather['weather'][0]['id'];
        city = currentWeather['name'];
      } catch (e) {
        print(e);
      }
    }
    else {
      print("API den değer gelmiyor!");
    }
  }

  WeatherDisplayData getWeatherDisplayData(){

    if(currentCondition <600){
      return WeatherDisplayData(
          weatherIcon: Icon(
          FontAwesomeIcons.cloud,
          size: 75.0,
          color:Colors.white
      ),
          weatherImage: AssetImage('assets/bulutlu.jpg'));
    }
    else{
      var now = new DateTime.now();
      if(now.hour >=19){
        return WeatherDisplayData(
            weatherIcon: Icon(
                FontAwesomeIcons.moon,
                size: 75.0,
                color:Colors.white
            ),
            weatherImage: AssetImage('assets/gece.jpg'));
      }else{
        return WeatherDisplayData(
            weatherIcon: Icon(
            FontAwesomeIcons.sun,
            size: 75.0,
            color:Colors.white
        ),
            weatherImage: AssetImage('assets/gunesli.jpg'));

    }
  }
}
}