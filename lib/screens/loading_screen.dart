import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String myKey='55fd2ade2e902dc9e959f9f3125fdae2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    // String url='http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$myKey';
    // geoCurrentLocation location = geoCurrentLocation();
    // await location.getCurrentLocation();
    //
    // // print(lat);
    // // print(long);
    // NetworkHelper networkHelper = NetworkHelper(
    //     url: 'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longtude}&appid=$myKey&units=metric');
    //
    // var weatherData = await networkHelper.getData();

    var weatherData= await WeatherModel().getLocationWeather();
    //print(weatherDataTest);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));

    // var wetherId= ['weather'][0]['id'];
    // var temper=decodeData['main']['temp'];
    // var city = decodeData['name'];

    // print(wetherId);
    // print(temper);
    // print(city);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
