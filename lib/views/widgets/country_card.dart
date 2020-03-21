import 'package:covid19_tracker/styles.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import '../../model/GetData.dart';


class CountryCardWidget extends StatelessWidget {
  String country;
  String cases;
  String todayCases;
  String deaths;
  String todayDeaths;
  String recovered;
  String active;
  String critical;

  CountryCardWidget(
      {this.country,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical});

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(top: 10.0),
        child: Card(
           color: DraculaOrchid,
            elevation: 0.0,
            child: Container(
                margin: EdgeInsets.only(right: 5, left: 5, bottom: 30),
                height: MediaQuery.of(context).size.width * 0.60,
                width: MediaQuery.of(context).size.width * 0.30,
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flags.getMiniFlag(getCountryCode(this.country), 16.0, 16.0),
                            SizedBox(width: 10.0,),
                            Text(this.country, style: Label2TextStyle, overflow: TextOverflow.ellipsis,),
                            // Icon(Icons.location_on, size: 24.0, color: Silver,),
                          ],
                        )
                        ),
                        SizedBox(height: 10.0,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                          Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(this.cases.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: NumberBigTextStyle),
                            Text("CONFIRMED CASES", style: SubLabel2Style,)
                          ],
                        ),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(this.deaths.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: NumberBigTextStyle),
                            Text("DEATHS", style: SubLabel2Style,)
                          ],
                        ),
                         ],
                       )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("CASES TODAY : ", style: SubLabelStyle,),
                            Text("DEATHS TODAY : ", style: SubLabelStyle),
                            Text("ACTIVE : ", style: SubLabelStyle),
                            Text("CRITICAL : ", style: SubLabelStyle),
                            SizedBox(height: 5.0),
                            Text("RECOVERED : ", style: SubLabelStyle),
                          ],
                        ),
                        SizedBox(width: 30.0),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(this.todayCases.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: SubLabelStyle),
                              Text(this.todayDeaths.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: SubLabelStyle),
                              Text(this.active.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: SubLabelStyle),
                              Text(this.critical.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: SubLabelStyle),
                               SizedBox(height: 5.0),
                               Text(this.recovered.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: SubLabelStyle),
                            ]),
                      ],
                    )
                  ],
                )

                ) 
                )
                ));
  }
}
