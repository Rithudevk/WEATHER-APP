import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weathers/model/weather_model.dart';
import 'package:weathers/services/weather_service.dart';

class WeatherProvider with ChangeNotifier{
    WeatherModel ?_weather;
    bool _loading=false;
    String ?_error;


    WeatherModel? get weather =>_weather;
     bool get  loading =>_loading;
     String ?get error => _error;


      WeatherProvider() {
    _loadLastSearchedCity();
  }


   Future<void> _loadLastSearchedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? city = prefs.getString('lastCity');
    if (city != null) {
      weatherData(city);
    }
  }



 
         Future<void>weatherData(String cityName) async{

          _loading=true;
          notifyListeners();
          try{
            _weather= await  WeatherService().weatherData(cityName);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('lastCity', cityName);
            _error='';

          }catch(e){
            _error=e.toString();

          }finally {
            _loading = false;
               notifyListeners();
    }

         }
       
}