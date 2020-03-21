class Overall{
  int cases;
  int deaths;
  int recovered;

  Overall({
    this.cases,
    this.deaths,
    this.recovered
  });

  factory Overall.fromJson(var json){
    return Overall(
       cases: json["cases"],
       deaths: json["deaths"],
       recovered: json["recovered"],
    );
  }
}