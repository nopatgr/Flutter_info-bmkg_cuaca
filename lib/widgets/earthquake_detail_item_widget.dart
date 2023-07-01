import 'package:flutter/material.dart';

class EarthquakeDetailItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;

  const EarthquakeDetailItemWidget({
    Key? key,
    required this.title,
    this.subtitle = "",
    this.trailing = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : const SizedBox(),
      trailing: trailing.isNotEmpty ? Text(trailing) : const SizedBox(),
    );
  }
}
