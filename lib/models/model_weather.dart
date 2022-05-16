class modleweather {
  String weatherStateName;
  String date;
  double maxTemb;
  double minTemb;
  double Temb;
  modleweather({
    required this.weatherStateName,
    required this.date,
    required this.maxTemb,
    required this.minTemb,
    required this.Temb,
  }); 

 factory modleweather.fromjson(Map<String,dynamic>data){
   return modleweather(
     weatherStateName: data['weather_state_name'],
     date            : data['applicable_date'],
     maxTemb         : data['max_temp'],
     minTemb         : data['min_temp'],
     Temb            : data['the_temp'],
  );
 }

 String getImage(){
   
  if(weatherStateName=='Clear' || weatherStateName=='Light Cloud'){
    return 'assets/images/clear.png';
  }else if(weatherStateName=='Sleet' || 
  weatherStateName=='Snow' || 
  weatherStateName=='Hail'
  ){return 'assets/images/snow.png';
  }else if(
    weatherStateName=='Heavy Cloud'
  ){return 'assets/images/cloudy.png';
  }else if(weatherStateName=='Light Rain' ||
  weatherStateName=='Heavy Rain	' ||
  weatherStateName == 'Showers'
  ){
    return 'assets/images/rainy.png';
  }else if(
    weatherStateName=='Thunderstorm' || 
    weatherStateName=='Thunder'
  ){
        return 'assets/images/thunderstorm.png';
  }else{
    return 'assets/images/clear.png';
  }
 }
}
 