class Overall{
  String cases;
  String deaths;
  String recovered;

  Overall({
    this.cases,
    this.deaths,
    this.recovered
  });

  factory Overall.fromJson(Map<String, dynamic> json){
    return Overall(
       cases: json["cases"],
       deaths: json["deaths"],
       recovered: json["recovered"],
    );
  }
}