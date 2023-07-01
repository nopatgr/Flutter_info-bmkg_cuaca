import '../models/time_model.dart';

class ParamModel {
  final String id;
  final String description;
  final String type;
  final List<TimeModel> times;

  ParamModel({
    required this.id,
    required this.description,
    required this.type,
    required this.times,
  });

  factory ParamModel.fromJson(Map<String, dynamic> json) {
    List<TimeModel> getListOfTimes(List<dynamic> timesJson) {
      List<TimeModel> times = [];

      for (var element in timesJson) {
        times.add(TimeModel.fromJson(element));
      }

      return times;
    }

    return ParamModel(
      id: json["id"] ?? "",
      description: json["description"] ?? "",
      type: json["type"] ?? "",
      times: getListOfTimes(json["times"]),
    );
  }
}
