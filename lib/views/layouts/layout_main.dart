import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'layout_country_list.dart';
import 'layout_total.dart';
import '../../styles.dart';

 

class LayoutMain extends StatefulWidget {
  LayoutMain({Key key}) : super(key: key);

  @override
  _LayoutMainState createState() => _LayoutMainState();
}

class _LayoutMainState extends State<LayoutMain> {

   
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            backgroundColor: DraculaOrchid,
            title: new Text("Are you sure ?", style: SubLabel3Style),
            content: new Text(
              'You are about to exit',
              style: SubLabel2Style,
            ),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.pop(context, false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => exit(0),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }


  @override
  void initState() {
    super.initState();
   SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlackPearl,
      appBar: AppBar(
        backgroundColor: BlackPearl,
        title: Text(
          "CV19 Realtime Data",
          style: AppbarTitleStyle,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Icons.refresh,
              size: 24.0,
              color: Clouds,
            ),
          )
        ],
        elevation: 2.0,
      ),
      body: GestureDetector(
        onTap: (){
          SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
        },
        child: WillPopScope(child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(flex: 1, child: TotalLayout()),
          Expanded(flex: 3, child: CountryListLayout()),
          //  Container(margin: EdgeInsets.symmetric(horizontal: 5.0), height: 50.0, width: 50.0,),
        ],
      ), 
      onWillPop: ()=> _onWillPop()))
    );
  }
}
