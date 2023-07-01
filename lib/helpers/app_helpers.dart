import 'package:info_bmkg/models/region_endpoint_model.dart';

import '../constants/api_constant.dart';

class AppHelpers {
  final List<String> _monthNames = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "Mei",
    "Jun",
    "Jul",
    "Agu",
    "Sep",
    "Okt",
    "Nov",
    "Des",
  ];

  String _getMonthNameInNumber(String monthName) {
    int index = _monthNames.indexWhere((element) => element == monthName) + 1;

    if (index < 10) {
      return "0$index";
    } else {
      return "$index";
    }
  }

  String getShakemapCode(String dateTime, String jam) {
    RegExp regex = RegExp(r'[^\w\s]+');

    // Mengubah dateTime menjadi kode shakemap
    // Contoh: 31 Agu 2022
    // Hasil: 20220831

    List<String> dateTimeList = dateTime.split(" ");

    String monthInNumber = _getMonthNameInNumber(dateTimeList[1]);

    String shakeMapDateTime =
        "${dateTimeList[2]}$monthInNumber${dateTimeList[0]}";

    // Mengubah jam menjadi kode shakemap
    // Contoh: 02:06:20 WIB
    // Hasil: 020620

    String time = jam.replaceAll(regex, "").split(" ")[0];

    // Return shakemap code
    // Hasil akhir: 20220831020620.mmi.jpg

    return "$shakeMapDateTime$time.mmi.jpg";
  }

  // Mendapatkan url shakemap secara lengkap

  String getShakeMapUrl(String dateTime, String jam) {
    String shakemapCode = getShakemapCode(dateTime, jam);

    String shakemapUrl = "${ApiConstant.gempaShakeMap}$shakemapCode";

    return shakemapUrl;
  }

  // Mendapatkan logo provinsi

  String getDomainMapUrl(String regionDomain) {
    if (regionDomain == "Aceh") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Flag_of_Aceh%2C_Indonesia.svg/640px-Flag_of_Aceh%2C_Indonesia.svg.png";
    } else if (regionDomain == "Sumatera Utara") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Flag_of_North_Sumatra.svg/640px-Flag_of_North_Sumatra.svg.png";
    } else if (regionDomain == "Sumatera Barat") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Flag_of_West_Sumatra.svg/640px-Flag_of_West_Sumatra.svg.png";
    } else if (regionDomain == "Riau") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Flag_of_Riau.svg/640px-Flag_of_Riau.svg.png";
    } else if (regionDomain == "Kep. Riau") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Flag_of_Riau_Islands.svg/640px-Flag_of_Riau_Islands.svg.png";
    } else if (regionDomain == "Jambi") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Flag_of_Jambi.svg/640px-Flag_of_Jambi.svg.png";
    } else if (regionDomain == "Sumatera Selatan") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Flag_of_South_Sumatra_%28vectorised%29.svg/640px-Flag_of_South_Sumatra_%28vectorised%29.svg.png";
    } else if (regionDomain == "Bengkulu") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Flag_of_Bengkulu.svg/640px-Flag_of_Bengkulu.svg.png";
    } else if (regionDomain == "Kep. Bangka Belitung") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Flag_of_Bangka-Belitung.svg/640px-Flag_of_Bangka-Belitung.svg.png";
    } else if (regionDomain == "Lampung") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_Lampung.svg/640px-Flag_of_Lampung.svg.png";
    } else if (regionDomain == "Banten") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Banten%2C_Indonesia.svg/640px-Flag_of_Banten%2C_Indonesia.svg.png";
    } else if (regionDomain == "DKI Jakarta") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Flag_of_Jakarta_%28vectorised%29.svg/640px-Flag_of_Jakarta_%28vectorised%29.svg.png";
    } else if (regionDomain == "Jawa Barat") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Flag_of_West_Java_%28vectorised%29.svg/640px-Flag_of_West_Java_%28vectorised%29.svg.png";
    } else if (regionDomain == "Jawa Tengah") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Flag_of_Central_Java.svg/640px-Flag_of_Central_Java.svg.png";
    } else if (regionDomain == "DI Yogyakarta") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Flag_of_Yogyakarta.svg/640px-Flag_of_Yogyakarta.svg.png";
    } else if (regionDomain == "Jawa Timur") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Flag_of_East_Java.svg/640px-Flag_of_East_Java.svg.png";
    } else if (regionDomain == "Bali") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Flag_of_Bali.svg/640px-Flag_of_Bali.svg.png";
    } else if (regionDomain == "Nusa Tenggara Barat") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Flag_of_West_Nusa_Tenggara.svg/640px-Flag_of_West_Nusa_Tenggara.svg.png";
    } else if (regionDomain == "Nusa Tenggara Timur") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Flag_of_East_Nusa_Tenggara.svg/640px-Flag_of_East_Nusa_Tenggara.svg.png";
    } else if (regionDomain == "Kalimantan Barat") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Flag_of_West_Kalimantan.svg/640px-Flag_of_West_Kalimantan.svg.png";
    } else if (regionDomain == "Kalimantan Tengah") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Central_Kalimantan.svg/640px-Flag_of_Central_Kalimantan.svg.png";
    } else if (regionDomain == "Kalimantan Selatan") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Flag_of_South_Kalimantan.svg/640px-Flag_of_South_Kalimantan.svg.png";
    } else if (regionDomain == "Kalimantan Timur") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_East_Kalimantan.svg/640px-Flag_of_East_Kalimantan.svg.png";
    } else if (regionDomain == "Kalimantan Utara") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Flag_of_North_Kalimantan.svg/640px-Flag_of_North_Kalimantan.svg.png";
    } else if (regionDomain == "Sulawesi Barat") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Flag_of_West_Sulawesi.svg/640px-Flag_of_West_Sulawesi.svg.png";
    } else if (regionDomain == "Sulawesi Selatan") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Flag_of_South_Sulawesi.svg/640px-Flag_of_South_Sulawesi.svg.png";
    } else if (regionDomain == "Sulawesi Tenggara") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Flag_of_Southeast_Sulawesi.svg/640px-Flag_of_Southeast_Sulawesi.svg.png";
    } else if (regionDomain == "Sulawesi Tengah") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Flag_of_Central_Sulawesi.svg/640px-Flag_of_Central_Sulawesi.svg.png";
    } else if (regionDomain == "Gorontalo") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Flag_of_Gorontalo.svg/640px-Flag_of_Gorontalo.svg.png";
    } else if (regionDomain == "Sulawesi Utara") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Flag_of_North_Sulawesi.svg/640px-Flag_of_North_Sulawesi.svg.png";
    } else if (regionDomain == "Maluku") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Flag_of_Maluku.svg/640px-Flag_of_Maluku.svg.png";
    } else if (regionDomain == "Maluku Utara") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Flag_of_North_Maluku.svg/640px-Flag_of_North_Maluku.svg.png";
    } else if (regionDomain == "Papua Barat") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Flag_of_West_Papua_%28vectorised%29.svg/640px-Flag_of_West_Papua_%28vectorised%29.svg.png";
    } else if (regionDomain == "Papua") {
      return "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Flag_of_Papua_2.svg/640px-Flag_of_Papua_2.svg.png";
    }

    return "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/640px-Flag_of_Indonesia.svg.png";
  }

  // Mendapatkan list region endpoint untuk dropdown search

  List<RegionEndpointModel> getRegionEndpointList() {
    return [
      RegionEndpointModel(label: "Aceh", endpoint: "aceh"),
      RegionEndpointModel(label: "Bali", endpoint: "bali"),
      RegionEndpointModel(label: "Banten", endpoint: "banten"),
      RegionEndpointModel(label: "Bengkulu", endpoint: "bengkulu"),
      RegionEndpointModel(label: "DI Yogyakarta", endpoint: "di-yogyakarta"),
      RegionEndpointModel(label: "DKI Jakarta", endpoint: "dki-jakarta"),
      RegionEndpointModel(label: "Gorontalo", endpoint: "gorontalo"),
      RegionEndpointModel(label: "Jambi", endpoint: "jambi"),
      RegionEndpointModel(label: "Jawa Barat", endpoint: "jawa-barat"),
      RegionEndpointModel(label: "Jawa Tengah", endpoint: "jawa-tengah"),
      RegionEndpointModel(label: "Jawa Timur", endpoint: "jawa-timur"),
      RegionEndpointModel(
          label: "Kalimantan Barat", endpoint: "kalimantan-barat"),
      RegionEndpointModel(
          label: "Kalimantan Selatan", endpoint: "kalimantan-selatan"),
      RegionEndpointModel(
          label: "Kalimantan Tengah", endpoint: "kalimantan-tengah"),
      RegionEndpointModel(
          label: "Kalimantan Timur", endpoint: "kalimantan-timur"),
      RegionEndpointModel(
          label: "Kalimantan Utara", endpoint: "kalimantan-utara"),
      RegionEndpointModel(
          label: "Kep. Bangka Belitung", endpoint: "bangka-belitung"),
      RegionEndpointModel(label: "Kep. Riau", endpoint: "kepulauan-riau"),
      RegionEndpointModel(label: "Lampung", endpoint: "lampung"),
      RegionEndpointModel(label: "Maluku", endpoint: "maluku"),
      RegionEndpointModel(label: "Maluku Utara", endpoint: "maluku-utara"),
      RegionEndpointModel(
          label: "Nusa Tenggara Barat", endpoint: "nusa-tenggara-barat"),
      RegionEndpointModel(
          label: "Nusa Tenggara Timur", endpoint: "nusa-tenggara-timur"),
      RegionEndpointModel(label: "Papua", endpoint: "papua"),
      RegionEndpointModel(label: "Papua Barat", endpoint: "papua-barat"),
      RegionEndpointModel(label: "Riau", endpoint: "riau"),
      RegionEndpointModel(label: "Sulawesi Barat", endpoint: "sulawesi-barat"),
      RegionEndpointModel(
          label: "Sulawesi Selatan", endpoint: "sulawesi-selatan"),
      RegionEndpointModel(
          label: "Sulawesi Tenggara", endpoint: "sulawesi-tenggara"),
      RegionEndpointModel(label: "Sulawesi Utara", endpoint: "sulawesi-utara"),
      RegionEndpointModel(label: "Sumatera Barat", endpoint: "sumatera-barat"),
      RegionEndpointModel(
          label: "Sumatera Selatan", endpoint: "sumatera-selatan"),
      RegionEndpointModel(label: "Sumatera Utara", endpoint: "sumatera-utara"),
      RegionEndpointModel(label: "Indonesia", endpoint: "indonesia"),
    ];
  }
}
