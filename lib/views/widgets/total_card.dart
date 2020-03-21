import 'package:flutter/material.dart';
import '../../styles.dart';
 

class TotalCard extends StatelessWidget {
  final String cases;
  final String title;
  

  TotalCard({
    this.cases,
    this.title,
 
  });


  @override
  Widget build(BuildContext context) {
    return Card(
        color: DraculaOrchid,
        elevation: 2.5,
        child: Container(
          margin: EdgeInsets.only(right: 5, left: 5, bottom: 20),
          height: MediaQuery.of(context).size.width * 0.5,
          width: MediaQuery.of(context).size.width * 0.50,
          padding: EdgeInsets.all(10),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                  Text(this.cases.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: NumberBigTextStyle,),
                  SizedBox(height: 10.0),
                  Text(this.title.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: SubLabel2Style, ),
            ],
          ) 
        )
      );
  }
}
