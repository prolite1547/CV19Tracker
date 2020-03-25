import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

import '../../styles.dart';
import '../widgets/country_card.dart';
import 'package:flutter/material.dart';
import '../../model/GetData.dart';
import 'package:http/http.dart' as http;

class CountryListLayout extends StatefulWidget {
  CountryListLayout({Key key}) : super(key: key);

  @override
  _CountryListLayoutState createState() => _CountryListLayoutState();
}

class _CountryListLayoutState extends State<CountryListLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child:  
           FutureBuilder(
         future: fetchCountry(http.Client()),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState){
                case ConnectionState.waiting:
                return Container(
                  color: DraculaOrchid,
                  child: Center(
                    child: Loading(
                        indicator: BallPulseIndicator(),
                        size: 54.0,
                        color: Silver),
                  ),
                );
                default:
                if(snapshot.hasError)
                    return Center(child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("There was a problem while fetching updated data. Kindly check your internet connection and try to reload this application.", textAlign: TextAlign.center,style: TextStyle(color:Colors.blueGrey),),
                    ));
                else
         
                  return ListView.builder(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 30.0),
                    itemCount: snapshot.data.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      
                        return CountryCardWidget(
                          country: snapshot.data[index].country,
                          cases: snapshot.data[index].cases.toString(),
                          todayCases: snapshot.data[index].todayCases.toString(),
                          deaths: snapshot.data[index].deaths.toString(),
                          todayDeaths:  snapshot.data[index].todayDeaths.toString(),
                          recovered: snapshot.data[index].recovered.toString(),
                          active: snapshot.data[index].active.toString(),
                          critical:  snapshot.data[index].critical.toString(),
                          );
                    },
                    );
                break;
            }
         },
       )
          
    );
  }
}