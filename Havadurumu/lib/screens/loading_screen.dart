import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:havadurumu/utils/location.dart';
import 'package:havadurumu/screens/main_screen.dart';
import 'package:havadurumu/utils/weather.dart';

class LoadingScreen extends StatefulWidget { //dinamik işlemler için loading screen ekledim,spinkit dönecek...


  @override
  _LoadingScreenState createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen> {
   LocationHelper? locationData;//location dosyasıyla bağlantı kurdum...
   Future<void>getLocationData() async{
     locationData=LocationHelper();
     await locationData?.getCurrentLocation();

     if(locationData?.latitude==null  || locationData?.longitude ==null) {
     print("Konum bilgileri gelmiyor.");

   }
   else{
     print("latitude: " +locationData!.latitude.toString());
     print("longitude: " +locationData!.longitude.toString());
     }
     }


     void getWeatherData() async{
     await getLocationData();
     WeatherData weatherData=WeatherData(locationData:locationData!);
     await weatherData.getCurrentTemperature();
     if(weatherData.currentTemperature == null ||
         weatherData.currentCondition == null){
       print("API den sıcaklık veya durum bilgisi boş dönüyor.");
     }

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
       return MainScreen(weatherData: weatherData,);
     }));

     }


     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
    getWeatherData();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(

        decoration: BoxDecoration( //arka plan rengi değiştireceğim...
         gradient: LinearGradient( //doğrusal geçişli renk istiyorum.
           begin:Alignment.topLeft,
           end:Alignment.bottomRight,
           colors: [Colors.purple,Colors.blue] //mordan maviye bir geçiş olacak...
         ) ,
        ),
        child:Center(

            child:SpinKitCubeGrid( //spinkit'in şeklini belirledim...
            color:Colors.white,
            size:150.0,
            duration:Duration(milliseconds:1200 ), //spinkit'in ne kadar döneceğini belirledim.
          )
        )
      ),
    );

}
}






