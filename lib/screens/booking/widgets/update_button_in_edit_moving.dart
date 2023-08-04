import 'package:flutter/material.dart';

import '../../../constant/const.dart';

// ignore: must_be_immutable
class UpdateButtonInEditMoving extends StatelessWidget {
  UpdateButtonInEditMoving({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    required this.function,
  });

  final double width;
  final double height;
  Color color;
  final String text;
  Function() function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width / 3,
      height: height / 18,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: const TextStyle(color: whiteShade, fontSize: 18),
        ),
      ),
    );
  }
}
