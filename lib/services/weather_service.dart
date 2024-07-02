
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weathers/model/weather_model.dart';

class WeatherService{


   final String api_Key='https://api.openweathermap.org/data/2.5/weather?q=kannur&appid=cd97cdce13754b536fe502a998560849';

   Future<WeatherModel>weatherData(String name) async{
          final respond= await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=${name}&appid=cd97cdce13754b536fe502a998560849'));
          var data=jsonDecode(respond.body.toString());

          if(respond.statusCode==200){
            return WeatherModel.fromJson(data);
          }else{
            return  throw 'Failed to load weather';
          }
  }
}