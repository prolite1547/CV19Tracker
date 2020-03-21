class Country{
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;

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

factory Country.fromJson(Map<String, dynamic> json){
    return Country(
       country: json["country"],
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