// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names








class Weather {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var wind_direc;
  var gust;
  var uv;
  var pressure;
  var precip;
  var last_update;

  Weather({
    required this.cityName,
    required this.icon,
    required this.condition,
    required this.temp,
    required this.wind,
    required this.humidity,
    required this.wind_direc,
    required this.gust,
    required this.uv,
    required this.pressure,
    required this.precip,
    required this.last_update
  });

 Weather.fromJson(Map<String,dynamic>json){
  cityName = json['location']['name'];
  icon = json['current']['condition']['icon'];
  condition = json ['current']['condition']['text'];
  temp = json['current']['temp_c'];
  wind = json['current']['wind_kph'];
  humidity = json['current']['humidity'];
  wind_direc= json['current']['wind_dir'];
  gust=json['current']['gust_kph'];
  uv = json['current']['uv'];
  pressure = json['current']['pressure_mb'];
  precip = json ['current']['precip_mm'];
  last_update = json['current']['last_updated'];
 }

}
