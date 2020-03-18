import 'package:flutter/material.dart';


class CountryCardWidget extends StatelessWidget {

  String country;
  String cases;
  String todayCases;
  String deaths;
  String todayDeaths;
  String recovered;
  String active;
  String critical;

  CountryCardWidget({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Card(
        elevation: 2.5,
        child: Container(
          child:  Column(
            children: <Widget>[
               Text(this.country)
            ],
          ) 
        )
      )
    );
  }
}