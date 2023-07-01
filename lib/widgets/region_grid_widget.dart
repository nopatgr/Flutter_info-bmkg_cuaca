import 'package:flutter/material.dart';

import '../models/region_model.dart';
import '../widgets/region_item_widget.dart';
import '../screens/region_weather_screen.dart';

class RegionGridWidget extends StatelessWidget {
  final List<RegionModel> weathers;
  const RegionGridWidget({
    super.key,
    required this.weathers,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.center,
      children: weathers.map((region) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => RegionWeatherScreen(region: region)),
              ),
            );
          },
          child: RegionItemWidget(
            domain: region.domain,
            description: region.description,
          ),
        );
      }).toList(),
    );
  }
}
