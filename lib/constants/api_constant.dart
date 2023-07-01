class ApiConstant {
  // API Gempa

  static final Uri gempaTerbaru =
      Uri.parse("https://data.bmkg.go.id/DataMKG/TEWS/autogempa.json");

  static final Uri gempaMagnitudeDiAtasLima =
      Uri.parse("https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json");

  static final Uri gempaDirasakan =
      Uri.parse("https://data.bmkg.go.id/DataMKG/TEWS/gempadirasakan.json");

  // Shakemap harus ditambah dengan kode_shakemap di bagian akhir.
  // Contoh: https://data.bmkg.go.id/DataMKG/TEWS/20220829175824.mmi.jpg

  static const String gempaShakeMap = "https://data.bmkg.go.id/DataMKG/TEWS/";

  // API Cuaca

  // Untuk Indonesia/provinsi, tambahkan nama provinsi di akhir
  // Contoh: https://cuaca-gempa-rest-api.vercel.app/weather/indonesia
  // Contoh: https://cuaca-gempa-rest-api.vercel.app/weather/jawa-tengah

  // Untuk kota, tambahkan nama provinsi dan nama kota di bagian akhir
  // Contoh: https://cuaca-gempa-rest-api.vercel.app/weather/jawa-barat/bandung

  // Source API: https://github.com/renomureza/cuaca-gempa-rest-api

  static const String weatherUrl =
      "https://cuaca-gempa-rest-api.vercel.app/weather/";
}
