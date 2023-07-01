import 'package:flutter/material.dart';
import '../enums/earthquake_enum.dart';
import '../models/earthquake_model.dart';
import '../widgets/app_drawer_widget.dart';
import '../services/earthquake_service.dart';
import '../widgets/earthquake_grid_widget.dart';

class EarthquakeScreen extends StatefulWidget {
  const EarthquakeScreen({Key? key}) : super(key: key);

  @override
  State<EarthquakeScreen> createState() => _EarthquakeScreenState();
}

class _EarthquakeScreenState extends State<EarthquakeScreen> {
  bool _isLoading = true;

  EarthquakeEnum _selectedEarthquakeEnum = EarthquakeEnum.gempaTerbaru;

  List<EarthquakeModel> _earthquakes = [];

  String _appBarTitle = "Gempa Terbaru";

  @override
  void initState() {
    super.initState();

    fetchEarthquake();
  }

  // Mendapatkan data eartquakes sesuai pilihan user

  Future<void> fetchEarthquake() async {
    if (_selectedEarthquakeEnum == EarthquakeEnum.gempaTerbaru) {
      _earthquakes =
          await EarthquakeService.getGempaBumiTerbaru().whenComplete(() {
        setState(() {
          _isLoading = !_isLoading;
        });
      });
    } else if (_selectedEarthquakeEnum ==
        EarthquakeEnum.gempaMagnitudeDiAtasLima) {
      _earthquakes = await EarthquakeService.getGempaBumiMagnitudeDiAtasLima()
          .whenComplete(() {
        setState(() {
          _isLoading = !_isLoading;
        });
      });
    } else if (_selectedEarthquakeEnum == EarthquakeEnum.gempaDirasakan) {
      _earthquakes =
          await EarthquakeService.getGempaBumiDirasakan().whenComplete(() {
        setState(() {
          _isLoading = !_isLoading;
        });
      });
    }
  }

  // Mendapatkan appbar title sesuai pilihan user

  void changeAppBarTitle() {
    if (_selectedEarthquakeEnum == EarthquakeEnum.gempaTerbaru) {
      _appBarTitle = "Gempa Terbaru";
    } else if (_selectedEarthquakeEnum ==
        EarthquakeEnum.gempaMagnitudeDiAtasLima) {
      _appBarTitle = "Gempa M 5+";
    } else if (_selectedEarthquakeEnum == EarthquakeEnum.gempaDirasakan) {
      _appBarTitle = "Gempa Dirasakan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
        centerTitle: true,
        actions: [
          PopupMenuButton<EarthquakeEnum>(
            onSelected: ((value) async {
              setState(() {
                _isLoading = !_isLoading;

                _selectedEarthquakeEnum = value;

                changeAppBarTitle();
              });

              await fetchEarthquake();
            }),
            itemBuilder: ((context) {
              return [
                const PopupMenuItem(
                  value: EarthquakeEnum.gempaTerbaru,
                  child: Text("Gempa Terbaru"),
                ),
                const PopupMenuItem(
                  value: EarthquakeEnum.gempaMagnitudeDiAtasLima,
                  child: Text("Gempa Magnitude 5+"),
                ),
                const PopupMenuItem(
                  value: EarthquakeEnum.gempaDirasakan,
                  child: Text("Gempa Dirasakan"),
                ),
              ];
            }),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _earthquakes.isNotEmpty
            ? EarthquakeGridWidget(earthquakes: _earthquakes)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const AppDrawerWidget(),
    );
  }
}
