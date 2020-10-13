import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String myKey='55fd2ade2e902dc9e959f9f3125fdae2';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    String urlCity='http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$myKey&units=metric';

    NetworkHelper networkHelperCity = NetworkHelper(
        url: urlCity);

    var temperCity = await networkHelperCity.getData();
    return temperCity;
  }

  Future<dynamic> getLocationWeather() async{
    geoCurrentLocation location = geoCurrentLocation();
    await location.getCurrentLocation();

    // print(lat);
    // print(long);
    NetworkHelper networkHelper = NetworkHelper(
        url: 'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longtude}&appid=$myKey&units=metric');

    var weatherData1 = await networkHelper.getData();
    //print(weatherData1);
    return weatherData1;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Одеваем шорты и 👕';
    } else if (temp < 10) {
      return 'Вам нужен 🧣 и 🧤';
    } else {
      return 'Тепло одеваемся';
    }
  }
}
