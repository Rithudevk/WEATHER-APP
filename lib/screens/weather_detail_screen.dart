

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weathers/constants/diamension.dart';
import 'package:weathers/constants/font.dart';
import 'package:weathers/constants/weather_image.dart';

import 'package:weathers/services/weather_provider.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({super.key});

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  @override
  Widget build(BuildContext context) {
     final weatherProvider =Provider.of<WeatherProvider>(context,listen: false);
     double ? kelvinTemparature= weatherProvider.weather?.main?.temp;
     double ? degreeCelcious =kelvinTemparature! -273.15;

     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
       iconTheme:const IconThemeData(color: Colors.white),
       title: TextButton(onPressed: () {
         weatherProvider.weatherData(
          weatherProvider.weather!.name.toString());
       }, child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Text('Refresh',
              style: TextStyle(
              color: Colors.white,
              fontFamily: gooleFont.fontFamily,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
           ),
         ],
       )),
       
      ),
      backgroundColor: Colors.black,
      body: weatherProvider.loading?const Center(
        child: CircularProgressIndicator(),
      ):weatherProvider.error!.isNotEmpty?Center(
        child: Text(weatherProvider.error.toString(),
        style: TextStyle(
          color: Colors.white,
          fontFamily: gooleFont.fontFamily,
        ),
        ),
      ):Container(
         margin:const EdgeInsets.only(
            top: 30,
          ),
          child: Center(
            child:Column(
              children: [
                 Container(
                  height: height*0.11,
                  width: width*0.3,
                  child: SvgPicture.asset(
                  weatherImage[weatherProvider.weather!.weather![0].description??'N/A']??'Assets/svgs/splash.svg',
                  fit: BoxFit.cover,
                  )
                ),

              const SizedBox(height: 20,),

                  Text(weatherProvider.weather!.name.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    fontFamily: gooleFont.fontFamily,
          
                  ),
                  ),
                 const SizedBox(height: 10,),
                 Text('${degreeCelcious.toStringAsFixed(0)} °c',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: gooleFont.fontFamily,
          
                  ),
                  ),
                   Text(weatherProvider.weather!.weather![0].description.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: gooleFont.fontFamily,
          
                  ),
                  ),
                    const SizedBox(height: 60,),
                    
                  Container(
                    height: 200,
                    width: 300,
         
                    padding:const EdgeInsets.only(
                      left: 30
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Column(
                            children: [
                        const SizedBox(height: 30,),
                         Container(
                         
                           height: 50,
                           width: 50,
                           decoration:const BoxDecoration(
                             image: DecorationImage(
                               image: AssetImage('Assets/svgs/humidity.png'),  )
                         
                           ),
                         ),
                         
                          const SizedBox(height: 20,),
                             Text('${weatherProvider.weather!.main!.humidity.toString()}%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                             fontWeight: FontWeight.w800,
                                             fontFamily: gooleFont.fontFamily,
                                   
                                           ),
                                           ),
                                           const SizedBox(height: 20,),
                                            Text('Humidity',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                             fontWeight: FontWeight.w800,
                                             fontFamily: gooleFont.fontFamily,
                                   
                                           ),
                                           )
                              ],
                            )
                          ],
                        ),
                             const SizedBox(width: 30,),
                      const  VerticalDivider(
                          color: Colors.white,
                      ),
                         const SizedBox(width: 30,),
                       Row(
                          children: [
                            Column(
                            children: [
                        const SizedBox(height: 30,),
                         Container(
                         
                           height: 50,
                           width: 50,
                           decoration:const BoxDecoration(
                             image: DecorationImage(
                               image: AssetImage('Assets/svgs/wind1.png'),  )
                         
                           ),
                         ),
                         
                          const SizedBox(height: 20,),
                             Text('${weatherProvider.weather!.wind!.speed.toString()}%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                             fontWeight: FontWeight.w800,
                                             fontFamily: gooleFont.fontFamily,
                                   
                                           ),
                                           ),
                                           const SizedBox(height: 20,),
                                            Text('wind',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                             fontWeight: FontWeight.w800,
                                             fontFamily: gooleFont.fontFamily,
                                   
                                           ),
                                           )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),

                    
                  )

              ],
            ) ,),
      ),

    );
  }
}