import './Country.dart';
import './Overall.dart';


import 'package:http/http.dart' as http;
import './CountryList.dart';
import 'dart:async';
import 'dart:convert';


Future<Country> getCountry() async {
  List<Country> cList = [];
  CountryList countryList;
    var response = await http.get(
        Uri.encodeFull("https://coronavirus-19-api.herokuapp.com/countries"),
        headers: {"Accept": "application/json"});
        var  jsonResponse  = jsonDecode(response.body);
        print(jsonResponse);
        // countryList =  CountryList.fromJSON(jsonResponse);
        // cList.addAll(countryList.countryList);
        
      
}

Future<Overall> getTotal() async{
  var response = await http.get(
        Uri.encodeFull("https://coronavirus-19-api.herokuapp.com/all"),
        headers: {"Accept": "application/json"});
    var data = jsonDecode(response.body);
    Overall overall = new Overall.fromJson(data);
    return overall;
}