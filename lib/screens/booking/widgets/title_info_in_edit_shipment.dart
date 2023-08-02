import 'package:flutter/cupertino.dart';

class TitleInfoWidget extends StatelessWidget {
  const TitleInfoWidget({
    super.key,
    required this.heading,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        SizedBox(
          width: width / 30,
        ),
         Text(
          heading,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
