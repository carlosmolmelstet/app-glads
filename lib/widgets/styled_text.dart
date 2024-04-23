import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.name,
    required this.style,
  });

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(name, style: style.copyWith());
  }
}