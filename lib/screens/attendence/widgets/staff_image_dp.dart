import 'package:flutter/cupertino.dart';

class StaffImageDp extends StatelessWidget {
  const StaffImageDp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            height: MediaQuery.of(context).size.height/4,
            child: Image.asset("asset/dp.jpg")),
        )
      ],
    );
  }
}