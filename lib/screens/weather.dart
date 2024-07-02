

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weathers/constants/diamension.dart';
import 'package:weathers/constants/font.dart';
import 'package:weathers/screens/weather_detail_screen.dart';
import 'package:weathers/services/weather_provider.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});
  @override
  State<Weather> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Weather> {

  var cityController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weatherProvider =Provider.of<WeatherProvider>(context,listen: false);
    return Scaffold(
     
     backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin:const EdgeInsets.only(
            top: 90
          ),
          child: Center(
            child: Column(
             
              children: [
                Container(
                  
                  height: height*0.11,
                  width: width*0.3,
                  child: SvgPicture.asset(
                   'Assets/svgs/splash.svg',
                  fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10,),
                  Text('discover weather in your city',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    fontFamily: gooleFont.fontFamily,
          
                  ),
                  ),
                 const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: cityController,
                      style:TextStyle(
                        color: Colors.white,
                        fontFamily: gooleFont.fontFamily,
                        
                      ) ,
                      autofocus: false,
                      cursorColor: Colors.white,
                      
                      decoration: InputDecoration(
          
                     focusedBorder: OutlineInputBorder(
                      borderSide:const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)
                     ),
                       focusColor: Colors.white,
                       hoverColor: Colors.white,
                       prefixIcon:const Icon(Icons.search),
                       prefixIconColor: Colors.white,
                      
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          
                        )
                      ),
                    ),
                  ),
                   const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:Colors.blue,
                    ),
                    onPressed: () {

                      if(cityController.text!=null){
                           weatherProvider.weatherData(cityController.text).then((value) {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>WeatherDetailScreen() ,));
                        },);
                      }else{

                    
                      }
                    
                  }, child: Container(
                       height: 55,
                       width: 200,
                      child: Center(
                        child: Text('Search',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: gooleFont.fontFamily
                        ),
                        ),
                      ),
                  ))
          
          
              ],
            ),
          ),
        ),
      )
    
    );
  }
}
