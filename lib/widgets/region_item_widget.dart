import 'package:flutter/material.dart';

class RegionItemWidget extends StatelessWidget {
  final String domain;
  final String description;

  const RegionItemWidget({
    super.key,
    required this.domain,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 140.0,
        height: 140.0,
        child: Center(
          child: ListTile(
            title: Text(domain),
            subtitle: Text(description),
          ),
        ),
      ),
    );
  }
}
