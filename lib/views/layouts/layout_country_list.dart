import '../widgets/country_card.dart';
import 'package:flutter/material.dart';
import '../../model/GetData.dart';
 
class CountryListLayout extends StatefulWidget {
  CountryListLayout({Key key}) : super(key: key);

  @override
  _CountryListLayoutState createState() => _CountryListLayoutState();
}

class _CountryListLayoutState extends State<CountryListLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: FutureBuilder(
         future: getCountry(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch(snapshot.connectionState){
                case ConnectionState.waiting:
                return Center(
                         child: CircularProgressIndicator(),
                         );
                default:
                if(snapshot.hasError)
                    return Center(child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("There was a problem while fetching updated data. Kindly check your internet connection and try to reload this application.", textAlign: TextAlign.center,style: TextStyle(color:Colors.blueGrey),),
                    ));
                else
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                    itemCount: snapshot.data.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                        return CountryCardWidget(country: snapshot.data[index].country);
                    },
                    );
                break;
            }
         },
       ),   
    );
  }
}