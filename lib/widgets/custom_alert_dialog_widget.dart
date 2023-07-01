import 'package:flutter/material.dart';

class CustomAlertDialogWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CustomAlertDialogWidget({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
