// ignore_for_file: file_names

class WeatherModel {
  String? name;
  String? country;
  String? text;
  String? icon;
  double? tempC;

  WeatherModel({
    required this.name,
    required this.country,
    required this.text,
    required this.icon,
    required this.tempC,
  });

  factory WeatherModel.fromJson(dynamic json) => WeatherModel(
        name: json["location"]["name"],
        country: json["location"]["country"],
        text: json["current"]["condition"]["text"],
        icon: json["current"]["condition"]["icon"],
        tempC: json["current"]["temp_c"],
      );
}
