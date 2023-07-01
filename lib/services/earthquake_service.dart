import 'dart:convert';
import 'package:http/http.dart' as http;

import '../constants/api_constant.dart';
import '../models/earthquake_model.dart';

class EarthquakeService {
  static Future<List<EarthquakeModel>> getGempaBumiTerbaru() async {
    final response = await http.get(ApiConstant.gempaTerbaru);

    if (response.statusCode == 200) {
      List<EarthquakeModel> earthquakes = [];

      EarthquakeModel earthquake = EarthquakeModel.fromJson(
          json.decode(response.body)["Infogempa"]["gempa"]);

      earthquakes.add(earthquake);

      return earthquakes;
    } else {
      throw Exception("Gagal mendapatkan informasi gempa");
    }
  }

  static Future<List<EarthquakeModel>> getGempaBumiMagnitudeDiAtasLima() async {
    final response = await http.get(ApiConstant.gempaMagnitudeDiAtasLima);

    if (response.statusCode == 200) {
      List<EarthquakeModel> earthquakes = [];

      final List<dynamic> earthquakeJson =
          json.decode(response.body)["Infogempa"]["gempa"];

      for (var earthquake in earthquakeJson) {
        earthquakes.add(EarthquakeModel.fromJson(earthquake));
      }

      return earthquakes;
    } else {
      throw Exception("Gagal mendapatkan informasi gempa");
    }
  }

  static Future<List<EarthquakeModel>> getGempaBumiDirasakan() async {
    final response = await http.get(ApiConstant.gempaDirasakan);

    if (response.statusCode == 200) {
      List<EarthquakeModel> earthquakes = [];

      final List<dynamic> earthquakeJson =
          json.decode(response.body)["Infogempa"]["gempa"];

      for (var earthquake in earthquakeJson) {
        earthquakes.add(EarthquakeModel.fromJson(earthquake));
      }

      return earthquakes;
    } else {
      throw Exception("Gagal mendapatkan informasi gempa");
    }
  }
}
