import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Text(
        text,
        style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }
}
