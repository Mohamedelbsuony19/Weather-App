import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/providers/weather_providar.dart';
import 'package:weather_app/serveses/server_weather.dart';

class SearchPage extends StatelessWidget {
  String ?nameCity;
  VoidCallback? updateUi;
  SearchPage({this.updateUi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
        backgroundColor: Color(0xFF1259D5),
        centerTitle: true,
      ),
      body: Stack(
        children:[
          Image.asset('assets/images/erath.jpg',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          ),  
           Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: 
            TextField(
              onSubmitted: (data)async{
                nameCity=data;
                serverWeather server=serverWeather();
              modleweather weather=await server.getWeather(nameCity: nameCity!);
              Provider.of<weatherProvider>(context,listen: false).weatherdata(weather);
              print('weather is ${weather.Temb}');

              Navigator.pop(context);
              },
              decoration: InputDecoration(
                
                hintText: 'Enter a city',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                label: Text('search'),
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16)
              ),
            ),
          ),
        ),]
      ),
    );
  }

String? name(){
  return nameCity;
}
}
