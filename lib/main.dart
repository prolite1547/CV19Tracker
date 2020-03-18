import 'package:flutter/material.dart';
import './views/layouts/layout_main.dart';

void main() => runApp(MyApp());

const MainLayout = "/";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Realtime Tracker',
      
    );
  }


  RouteFactory _routes(){
     return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        // case SplashRoute:
        //   screen = SplashScreen();
        // break;
        case MainLayout:
          screen =  LayoutMain();
        break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
 
 
