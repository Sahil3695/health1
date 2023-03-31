import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BackgroundCircle extends StatelessWidget {
  final circleBorderWidth;
  final cicleOpacity;
  final circleWidth;
  final circleColor;
  const BackgroundCircle(
      {super.key,
      required this.cicleOpacity,
      required this.circleBorderWidth,
      required this.circleColor,
      required this.circleWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleWidth,
      height: circleWidth,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: circleColor.withOpacity(cicleOpacity),
              width: circleBorderWidth)),
    );
  }
}
