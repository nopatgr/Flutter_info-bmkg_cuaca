import 'package:flutter/material.dart';

import '../models/earthquake_model.dart';
import '../widgets/earthquake_detail_grid_widget.dart';

class EarthquakeGridWidget extends StatelessWidget {
  final List<EarthquakeModel> earthquakes;

  const EarthquakeGridWidget({super.key, required this.earthquakes});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: earthquakes.map((earthquake) {
        return Card(
          child: ExpansionTile(
            title: Text("Gempa M ${earthquake.magnitude}"),
            children: [
              EarthquakeDetailGridWidget(earthquake: earthquake),
            ],
          ),
        );
      }).toList(),
    );
  }
}
