import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:info_bmkg/models/region_model.dart';

import '../constants/api_constant.dart';

class WeatherService {
  static Future<List<RegionModel>> getProvinceWeather(
      String provinceEndpoint) async {
    final response = await http
        .get(Uri.parse("${ApiConstant.weatherUrl}$provinceEndpoint"))
        .timeout(
          const Duration(seconds: 360),
        );

    if (response.statusCode == 200) {
      List<RegionModel> weathers = [];

      final List<dynamic> jsonWeatherResult =
          json.decode(response.body)["data"]["areas"];

      for (var element in jsonWeatherResult) {
        weathers.add(RegionModel.fromJson(element));
      }

      return weathers;
    } else {
      throw Exception("Gagal mendapatkan informasi gempa");
    }
  }

  // static Future<void> getCityWeather(
  //     String provinceEndpoint, String cityEndpoint) async {}
}
