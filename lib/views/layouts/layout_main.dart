import 'package:flutter/material.dart';
import  './layout_country_list.dart';

class LayoutMain extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         title: Text("COVID 19 TRACKER"),
         
       ),
       body: CountryListLayout(),
    );
  }
}