import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:weather_app/models/model_weather.dart';
class serverWeather{

  String baseurl='https://www.metaweather.com';

  Future<int> getCityId({required String nameCity})async{
  Uri url=Uri.parse('$baseurl/api/location/search/?query=$nameCity'); 

     http.Response res =await http.get(url);
     List<dynamic>data=jsonDecode(res.body);
     int cityId=data[0]['woeid'];
     return cityId;
 
  }

  
  Future<modleweather> getWeather({required String nameCity}) async{
    int id =await getCityId(nameCity: nameCity);
    Uri url =Uri.parse('$baseurl/api/location/$id/');
    http.Response res=await http.get(url);
   Map<String,dynamic>jsondata =jsonDecode(res.body);
   Map<String,dynamic>data =jsondata["consolidated_weather"][0];
    modleweather newData = modleweather.fromjson(data);    
          return newData;
  }
}