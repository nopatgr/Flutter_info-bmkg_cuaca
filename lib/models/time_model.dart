class TimeModel {
  final String type;
  final String h;
  final String datetime;
  final String code;
  final String name;
  final String value;
  final String day;
  final String celcius;
  final String fahrenheit;
  final String deg;
  final String card;
  final String sexa;
  final String kt;
  final String mph;
  final String kph;
  final String ms;

  TimeModel({
    this.type = "",
    this.h = "",
    this.datetime = "",
    this.code = "",
    this.name = "",
    this.value = "",
    this.day = "",
    this.celcius = "",
    this.fahrenheit = "",
    this.deg = "",
    this.card = "",
    this.sexa = "",
    this.kt = "",
    this.mph = "",
    this.kph = "",
    this.ms = "",
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      type: json["type"] ?? "",
      h: json["h"] ?? "",
      datetime: json["datetime"] ?? "",
      code: json["code"] ?? "",
      name: json["name"] ?? "",
      value: json["value"] ?? "",
      day: json["day"] ?? "",
      celcius: json["celcius"] ?? "",
      fahrenheit: json["fahrenheit"] ?? "",
      deg: json["deg"] ?? "",
      card: json["card"] ?? "",
      sexa: json["sexa"] ?? "",
      kt: json["kt"] ?? "",
      mph: json["mph"] ?? "",
      kph: json["kph"] ?? "",
      ms: json["ms"] ?? "",
    );
  }
}
