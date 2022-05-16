import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_providar.dart';

class HomePage extends StatefulWidget {

   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    SearchPage page;
    modleweather? weatherDate=
      Provider.of<weatherProvider>(context,listen: true).weatherdataProvider;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App',style: TextStyle(color: Colors.yellowAccent),),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SearchPage();
            } 
            )
            );
          }, icon: Icon(Icons.search)
          )
                ],
      ),
      body: Provider.of<weatherProvider>(context,listen: true).weatherdataProvider==null ?
       Stack(
         children:[
           Image.asset('assets/images/matar.webp',
           fit: BoxFit.fill,
           width:double.infinity,
           height:double.infinity,
           ),
            Center(
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            
            children: [
              Container(
                margin: EdgeInsets.only(top: 230),
                child: Column(
                  
                  children: [
                    Text(
                      'searching now ',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.yellowAccent
                      ),
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50,vertical: 10))
                      ),
                      onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SearchPage();
                      }));
                    },
                     child: Text('go', style: TextStyle(
                       fontSize: 30,
                       color: Colors.yellowAccent
                     ),
                     )
                     ),
                  ],
                ),
              )
            ],
          ),
             ),]
       ) : Stack(
         children: [
           Image.asset('assets/images/bkDatajpg.jpg',
           width: double.infinity,
           height: double.infinity,
           fit: BoxFit.fill,
           ),
           Padding(
             padding: const EdgeInsets.only(top: 30,left: 200),
             child:Row(
               children: [
                  Image.asset(weatherDate?.getImage()??'',width: 50,height: 50,),
                  Text('Weather',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22
                ),
                )
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 100,left: 245),
             child: Text(weatherDate?.Temb.toStringAsFixed(1)??'',
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
                
                ),
                ),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 100,left: 40),
             child: Text('${weatherDate?.weatherStateName}',
              style: TextStyle(
                color: Color(0xFFFDDC71),
                fontSize: 28
                ),
                ),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 210,left: 210,right: 25),
             child: Divider(
                color: Colors.white
              ),
           ),
           Padding(
             padding: const EdgeInsets.only(top: 190,left: 230,right: 25),
             child: Row(
               children: [
                 Text('${weatherDate?.maxTemb.toStringAsFixed(1)} / ',style: TextStyle(
                  color: Colors.white,)
                  ),
                  
                 Text('${weatherDate?.minTemb.toStringAsFixed(1)}',style: TextStyle(
                  color: Colors.white,)
                  ),
                  Text('   c',style: TextStyle(
                  color: Colors.yellowAccent,)
                  ),
               ],
             ),

           ),
           Padding(
             padding: const EdgeInsets.only(top: 230,left: 225),
             child: Text('${weatherDate?.date}',
              style: TextStyle(
                color: Colors.white,
                
                ),
                ),
        
           )],
       )
      
    );
  }
}
