import 'package:covid19_tracker/views/widgets/total_card.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import '../../styles.dart';
import '../../model/GetData.dart';

class TotalLayout extends StatefulWidget {
  TotalLayout({Key key}) : super(key: key);
  @override
  _TotalLayoutState createState() => _TotalLayoutState();
}

class _TotalLayoutState extends State<TotalLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: FutureBuilder(
          future: getTotal(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container(
                  color: DraculaOrchid,
                  child: Center(
                    child: Loading(
                        indicator: BallPulseIndicator(),
                        size:  54.0,
                        color: Silver),
                  ),
                );
                break;
              default:
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      switch (index) {
                        case 0:
                          return TotalCard(
                            title: "TOTAL CONFIRMED",
                            cases: snapshot.data.cases.toString(),
                           
                          );
                          break;
                        case 1:
                          return TotalCard(
                            title: "TOTAL DEATHS",
                            cases: snapshot.data.deaths.toString(),
                          
                          );
                          break;
                        case 2:
                          return TotalCard(
                            title: "TOTAL RECOVERIES",
                            cases: snapshot.data.recovered.toString(),
                          );
                          break;
                        default:
                          return TotalCard(
                            title: "RECOVERIES",
                            cases: snapshot.data.recovered.toString(),
                          );
                          break;
                      }
                    });
                break;
            }
          }),
    );
  }
}
