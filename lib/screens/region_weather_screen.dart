import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../locators/locator.dart';
import '../helpers/app_helpers.dart';
import '../models/region_model.dart';
import '../widgets/region_params_grid_widget.dart';

class RegionWeatherScreen extends StatelessWidget {
  final RegionModel region;
  const RegionWeatherScreen({
    super.key,
    required this.region,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(region.description),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        imageUrl: getItLocator
                            .get<AppHelpers>()
                            .getDomainMapUrl(region.domain),
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Text("Maaf, gambar tidak ditemukan"),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    ListTile(
                      title: const Text("Latitude"),
                      trailing: Text(region.latitude),
                    ),
                    ListTile(
                      title: const Text("Longitude"),
                      trailing: Text(region.longitude),
                    ),
                    ListTile(
                      title: const Text("Coordinate"),
                      trailing: Text(region.coordinate),
                    ),
                    ListTile(
                      title: const Text("Kota"),
                      trailing: Text(region.description),
                    ),
                    ListTile(
                      title: const Text("Provinsi"),
                      trailing: Text(region.domain),
                    ),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),
            ),
            region.params!.isNotEmpty
                ? RegionParamsGridWidget(params: region.params!)
                : const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                      child: Text("Tidak ada informasi cuaca ..."),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
