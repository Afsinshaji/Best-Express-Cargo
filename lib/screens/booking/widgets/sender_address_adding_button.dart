import 'package:best_seller/common/shipment_textfield.dart';
import 'package:best_seller/screens/booking/inside_screen/sender_info_adding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/const.dart';
import 'drop_down_widget.dart';

class SenderReceiverWithButtonWidget extends StatelessWidget {
  const SenderReceiverWithButtonWidget({
    super.key,
    required this.dropTitle,
    required this.dropHint,
    required this.textFieldTitle,
    required this.textFieldHint,
 
  });
  final String dropTitle;
  final String dropHint;
  
  final String textFieldTitle;
  final String textFieldHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropDownListWidget(
                boxWidth: 1.4, title: dropTitle, hintText: dropTitle),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => const SenderInfoAddingScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: logoBlue,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
                    textStyle:
                        const TextStyle(fontSize: 15, color: whiteShade)),
                child: const Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: whiteShade,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        ShipmentTextFieldWidget(
            title: textFieldTitle,
            wlength: 0,
            hintText: textFieldHint,
            hlength: 19)
      ],
    );
  }
}
