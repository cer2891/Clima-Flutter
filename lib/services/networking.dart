import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  NetworkHelper({this.url});

  final String url;
  String data;
  var decodeData;

  Future getData() async {
    http.Response response = await http.get(this.url);
        //'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$myKey');

    if (response.statusCode == 200) {
      data = response.body;
      return(jsonDecode(data));
    } else {
      print(response.statusCode);
    }
  }
}