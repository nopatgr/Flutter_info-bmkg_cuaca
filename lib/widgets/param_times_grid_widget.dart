import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../models/time_model.dart';

class ParamTimesGridWidget extends StatelessWidget {
  final List<TimeModel> times;

  const ParamTimesGridWidget({
    super.key,
    required this.times,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.center,
      spacing: 20.0,
      runSpacing: 20.0,
      children: times.map((time) {
        String dateTimeFormatted = "";

        if (time.datetime.isNotEmpty) {
          String dateWithT =
              "${time.datetime.substring(0, 8)}T${time.datetime.substring(8)}";
          DateTime dateTime = DateTime.parse(dateWithT);

          dateTimeFormatted =
              DateFormat("EEEE, d MMMM yyyy - HH:mm", "id_ID").format(
            dateTime,
          );
        }

        return SizedBox(
          width: 140.0,
          // height: 200.0,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  time.datetime.isNotEmpty
                      ? ListTile(
                          title: const Text("Tanggal"),
                          subtitle: Text("$dateTimeFormatted WIB"),
                        )
                      : const SizedBox(),
                  time.value.isNotEmpty
                      ? ListTile(
                          title: const Text("Value"),
                          subtitle: Text(time.value),
                        )
                      : const SizedBox(),
                  time.celcius.isNotEmpty && time.fahrenheit.isNotEmpty
                      ? ListTile(
                          title: const Text("Suhu"),
                          subtitle:
                              Text("${time.celcius} / ${time.fahrenheit}"),
                        )
                      : const SizedBox(),
                  time.name.isNotEmpty
                      ? ListTile(
                          title: const Text("Kondisi"),
                          subtitle: Text(time.name),
                        )
                      : const SizedBox(),
                  time.deg.isNotEmpty
                      ? ListTile(
                          title: const Text("DEG"),
                          subtitle: Text(time.deg),
                        )
                      : const SizedBox(),
                  time.card.isNotEmpty
                      ? ListTile(
                          title: const Text("Arah Angin"),
                          subtitle: Text(time.card),
                        )
                      : const SizedBox(),
                  time.sexa.isNotEmpty
                      ? ListTile(
                          title: const Text("SEXA"),
                          subtitle: Text(time.sexa),
                        )
                      : const SizedBox(),
                  time.kt.isNotEmpty
                      ? ListTile(
                          title: const Text("KT"),
                          subtitle: Text(time.kt),
                        )
                      : const SizedBox(),
                  time.mph.isNotEmpty
                      ? ListTile(
                          title: const Text("MPH"),
                          subtitle: Text(time.mph),
                        )
                      : const SizedBox(),
                  time.kph.isNotEmpty
                      ? ListTile(
                          title: const Text("KPH"),
                          subtitle: Text(time.kph),
                        )
                      : const SizedBox(),
                  time.ms.isNotEmpty
                      ? ListTile(
                          title: const Text("MS"),
                          subtitle: Text(time.ms),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
