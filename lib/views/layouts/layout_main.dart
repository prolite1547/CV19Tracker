import 'package:flutter/material.dart';
import 'layout_country_list.dart';
import '../../styles.dart';

class LayoutMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MidnightBlue,
        title: Text(
          "CV19 Tracker",
        ),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                     Expanded(
                       flex: 1,
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget> [
                          Text("NO. of CASES"),
                          Text("TOTAL CASES")
                       ]
                     )),
                     Expanded(
                       flex: 1,
                       child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget> [
                          Text("NO. of CASES"),
                          Text("TOTAL CASES")
                       ]
                     ))
                  ])),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CountryListLayout()
                ],
              ))
        ],
      ),
    );
  }
}
