class Country{
  String country;
  String cases;
  String todayCases;
  String deaths;
  String todayDeaths;
  String recovered;
  String active;
  String critical;

  Country({
    this.country,
    this.cases,
     this.todayCases,
     this.deaths,
     this.todayDeaths,
     this.recovered,
     this.active,
     this.critical
  });

factory Country.fromJson(Map<dynamic, dynamic> json){
    return Country(
       country: json["countyr"],
       cases: json["cases"],
       todayCases: json["todayCases"],
       deaths: json["deaths"],
       todayDeaths: json["todayDeaths"],
       recovered: json["recovered"],
       active: json["active"],
       critical: json["critical"]
    );
}
}