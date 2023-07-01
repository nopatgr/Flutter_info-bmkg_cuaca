import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../locators/locator.dart';
import '../helpers/app_helpers.dart';
import '../models/region_model.dart';
import '../services/weather_service.dart';
import '../widgets/app_drawer_widget.dart';
import '../widgets/region_grid_widget.dart';
import '../models/region_endpoint_model.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  RegionEndpointModel _selectedRegionEndpoint =
      RegionEndpointModel(label: "Indonesia", endpoint: "indonesia");

  List<RegionModel> _weathers = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    fetchWeather();
  }

  Future<void> fetchWeather() async {
    _weathers = await WeatherService.getProvinceWeather(
            _selectedRegionEndpoint.endpoint)
        .whenComplete(() {
      setState(() {
        _isLoading = !_isLoading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuaca"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownSearch<RegionEndpointModel>(
                  items: getItLocator.get<AppHelpers>().getRegionEndpointList(),
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Wilayah",
                      hintText: "Pilih wilayah ...",
                    ),
                  ),
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: "Cari wilayah ...",
                      ),
                    ),
                  ),
                  itemAsString: ((item) => item.label),
                  onChanged: ((value) async {
                    setState(() {
                      _isLoading = !_isLoading;

                      _selectedRegionEndpoint = value!;
                    });

                    await fetchWeather();
                  }),
                  selectedItem: _selectedRegionEndpoint,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RegionGridWidget(weathers: _weathers),
              ],
            )),
      ),
      drawer: const AppDrawerWidget(),
    );
  }
}
