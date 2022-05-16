import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/model_weather.dart';

class weatherProvider extends ChangeNotifier{
  modleweather? weatherdataProvider ;
   weatherdata(modleweather weather){
    weatherdataProvider=weather;
    notifyListeners();
  }
}