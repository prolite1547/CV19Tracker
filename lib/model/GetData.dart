import './Country.dart';
import './Overall.dart';


import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<Country> getCountry() async {
    var response = await http.post(
        Uri.encodeFull("https://coronavirus-19-api.herokuapp.com/countries"),
        headers: {"Accept": "application/json"});
    var data = jsonDecode(response.body);
    Country country = new Country.fromJson(data);
    return country;
}

Future<Overall> getTotal() async{
  var response = await http.post(
        Uri.encodeFull("https://coronavirus-19-api.herokuapp.com/all"),
        headers: {"Accept": "application/json"});
    var data = jsonDecode(response.body);
    Overall overall = new Overall.fromJson(data);
    return overall;
}