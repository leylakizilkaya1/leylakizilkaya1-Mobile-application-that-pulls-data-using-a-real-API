import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:havadurumu/utils/weather.dart';


class MainScreen extends StatefulWidget {

  final WeatherData weatherData;

  MainScreen({required this.weatherData});


  @override
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  late int temperature;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;
  late String city;

  void updateDisplayInfo(WeatherData weatherData) {
    setState(() {
      temperature = weatherData.currentTemperature.round();
      city = weatherData.city;
      WeatherDisplayData weatherDisplayData = weatherData
          .getWeatherDisplayData();
      backgroundImage = weatherDisplayData.weatherImage;
      weatherDisplayIcon = weatherDisplayData.weatherIcon;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            //expand ayarı yaptım ki genişleyebilsin..
            decoration: BoxDecoration( //resmin birini getirdim ki bakalım nasıl olmuş...
                image: DecorationImage(
                  image: backgroundImage,
                  //parantez içinde resmin yolunu tanımladım...
                  fit: BoxFit.cover,

                )
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 40,),
                Container(
                  child: weatherDisplayIcon,
                ),
                SizedBox(height: 15,),
                Center(
                  child: Text('$temperature° ',

                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 70.0,
                        letterSpacing: -5
                    ),

                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text(city,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        letterSpacing: -5
                    ),
                  ),
                ),
              ],
            ),
        ),
    );
  }
}

