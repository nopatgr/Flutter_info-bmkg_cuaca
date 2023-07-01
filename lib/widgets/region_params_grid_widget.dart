import 'package:flutter/material.dart';

import '../models/param_model.dart';
import '../widgets/param_times_grid_widget.dart';

class RegionParamsGridWidget extends StatelessWidget {
  final List<ParamModel> params;

  const RegionParamsGridWidget({
    super.key,
    required this.params,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        List.generate(params.length, (index) {
          ParamModel param = params[index];

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(param.description),
                subtitle: Text(param.type),
              ),
              ParamTimesGridWidget(times: param.times),
            ],
          );
        }),
      ),
    );
  }
}
