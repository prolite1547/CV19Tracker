import './Country.dart';
import './Overall.dart';


import 'package:http/http.dart' as http;
import './CountryList.dart';
import 'dart:async';
import 'dart:convert';


// Future<Country> getCountry() async {
//   List<Country> cList = [];
//   CountryList countryList;
//     var response = await http.get(
//         Uri.encodeFull("https://coronavirus-19-api.herokuapp.com/countries"),
//         headers: {"Accept": "application/json"});
//         var  jsonResponse  = jsonDecode(response.body);
//         print(jsonResponse);
//         // countryList =  CountryList.fromJSON(jsonResponse);
//         // cList.addAll(countryList.countryList);
// }

 var couontryCode = ["AD","AE","AF","AG","AI","AL","AM","AO","AR","AS","AT","AU","AW","AX","AZ","BA","BB","BD","BE","BF","BG","BH","BI","BJ","BL","BM","BN","BO","BR","BS","BT","BV","BW","BY","BZ","CA","CC","CD","CF","CG","CH","CI","CK","CL","CM","CN","CO","CR","CU","CV","CW","CX","CY","CZ","DE","DJ","DK","DM","DO","DZ","EC","EE","EG","ER","ES","ET","EU","FI","FJ","FK","FM","FO","FR","GA","GB","GB-ENG","GB-NIR","GB-SCT","GB-WLS","GB-ZET","GD","GE","GF","GG","GH","GI","GL","GM","GN","GP","GQ","GR","GS","GT","GU","GW","GY","HK","HM","HN","HR","HT","HU","ID","IE","IL","IM","IN","IO","IQ","IR","IS","IT","JE","JM","JO","JP","KE","KG","KH","KI","KM","KN","KP","KR","KW","KY","KZ","LA","LB","LC","LGBT","LI","LK","LR","LS","LT","LU","LV","LY","MA","MC","MD","ME","MF","MG","MH","MK","ML","MM","MN","MO","MP","MQ","MR","MS","MT","MU","MV","MW","MX","MY","MZ","NA","NC","NE","NF","NG","NI","NL","NO","NP","NR","NU","NZ","OM","PA","PE","PF","PG","PH","PK","PL","PM","PN","PR","PS","PT","PW","PY","QA","RE","RO","RS","RU","RW","SA","SB","SC","SD","SE","SG","SH","SI","SJ","SK","SL","SM","SN","SO","SR","SS","ST","SV","SX","SY","SZ","TC","TD","TF","TG","TH","TJ","TK","TL","TM","TN","TO","TR","TT","TV","TW","TZ","UA","UG","UM","US","US-CA","UY","UZ","VA","VC","VE","VG","VI","VN","VU","WF","WS","XK","YE","YT","ZA","ZM","ZW"];
 var countryNames = ["Andorra","UAE","Afghanistan","Antigua & Barbuda","Anguilla","Albania","Armenia","Angola","Argentina","American Samoa","Austria","Australia","Aruba","Åland Islands","Azerbaijan","Bosnia and Herzegovina","Barbados","Bangladesh","Belgium","Burkina Faso","Bulgaria","Bahrain","Burundi","Benin","St. Barthélemy","Bermuda","Brunei","Bolivia","Brazil","Bahamas","Bhutan","Bouvet Island","Botswana","Belarus","Belize","Canada","Cocos (Keeling) Islands","Congo - Kinshasa","Central African Republic","Congo - Brazzaville","Switzerland","Côte d’Ivoire","Cook Islands","Chile","Cameroon","China","Colombia","Costa Rica","Cuba","Cape Verde","Curaçao","Christmas Island","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominica","Dominican Republic","Algeria","Ecuador","Estonia","Egypt","Eritrea","Spain","Ethiopia","European Union","Finland","Fiji","Falkland Islands","Micronesia","Faroe Islands","France","Gabon","UK","England","Northern Ireland","Scotland","Wales","Shetland","Grenada","Georgia","French Guiana","Guernsey","Ghana","Gibraltar","Greenland","Gambia","Guinea","Guadeloupe","Equatorial Guinea","Greece","So. Georgia & So. Sandwich Isl.","Guatemala","Guam","Guinea-Bissau","Guyana","Hong Kong","Heard & McDonald Islands","Honduras","Croatia","Haiti","Hungary","Indonesia","Ireland","Israel","Isle of Man","India","British Indian Ocean Territory","Iraq","Iran","Iceland","Italy","Jersey","Jamaica","Jordan","Japan","Kenya","Kyrgyzstan","Cambodia","Kiribati","Comoros","St. Kitts & Nevis","N. Korea","S. Korea","Kuwait","Cayman Islands","Kazakhstan","Laos","Lebanon","St. Lucia","Pride","Liechtenstein","Sri Lanka","Liberia","Lesotho","Lithuania","Luxembourg","Latvia","Libya","Morocco","Monaco","Moldova","Montenegro","St. Martin","Madagascar","Marshall Islands","Macedonia","Mali","Myanmar (Burma)","Mongolia","Macao","Northern Mariana Islands","Martinique","Mauritania","Montserrat","Malta","Mauritius","Maldives","Malawi","Mexico","Malaysia","Mozambique","Namibia","New Caledonia","Niger","Norfolk Island","Nigeria","Nicaragua","Netherlands","Norway","Nepal","Nauru","Niue","New Zealand","Oman","Panama","Peru","French Polynesia","Papua New Guinea","Philippines","Pakistan","Poland","St. Pierre & Miquelon","Pitcairn Islands","Puerto Rico","Palestine","Portugal","Palau","Paraguay","Qatar","Réunion","Romania","Serbia","Russia","Rwanda","Saudi Arabia","Solomon Islands","Seychelles","Sudan","Sweden","Singapore","St. Helena","Slovenia","Svalbard & Jan Mayen","Slovakia","Sierra Leone","San Marino","Senegal","Somalia","Suriname","South Sudan","São Tomé & Príncipe","El Salvador","Sint Maarten","Syria","Swaziland","Turks & Caicos Islands","Chad","French Southern Territories","Togo","Thailand","Tajikistan","Tokelau","Timor-Leste","Turkmenistan","Tunisia","Tonga","Turkey","Trinidad & Tobago","Tuvalu","Taiwan","Tanzania","Ukraine","Uganda","U.S. Outlying Islands","USA","California","Uruguay","Uzbekistan","Vatican City","St. Vincent & Grenadines","Venezuela","British Virgin Islands","U.S. Virgin Islands","Vietnam","Vanuatu","Wallis & Futuna","Samoa","Kosovo","Yemen","Mayotte","South Africa","Zambia","Zimbabwe"];

Future<List<Country>> fetchCountry(http.Client client) async {
  final response =
      await client.get('https://coronavirus-19-api.herokuapp.com/countries');
  return parseCountry(response.body);
}

List<Country> parseCountry(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Country>((json) => Country.fromJson(json)).toList();
}


String getCountryCode(String countryName){
  String code = "ZW";
  for(int x = 0; x< countryNames.length; x ++){
      if(countryName == countryNames[x]){
        code = couontryCode[x];
        return code;
      }
  }
  return code;
}


Future<Overall> getTotal() async{
  var response = await http.get(
        Uri.encodeFull("https://coronavirus-19-api.herokuapp.com/all"),
        headers: {"Accept": "application/json"});
    var data = jsonDecode(response.body);
 
    Overall overall = new Overall.fromJson(data);
    return overall;
}
 
