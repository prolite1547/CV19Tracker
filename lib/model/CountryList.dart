import './Country.dart';

class CountryList{
 List<Country> countryList;
  
  CountryList({this.countryList});

  factory CountryList.fromJSON(Map<dynamic,dynamic> json){
    return CountryList(countryList: parseCountry(json));
  }

  static List<Country> parseCountry(countryJSON){
    var cList = countryJSON as List;
    List<Country> _countryList = cList.map((data)=> Country.fromJson(data)).toList();
    return _countryList;
  }

}