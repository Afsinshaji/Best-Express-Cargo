import 'package:best_seller/common/shipment_textfield.dart';
import 'package:best_seller/screens/booking/inside_screen/booking_no_in_edit_shipment.dart';
import 'package:best_seller/screens/booking/inside_screen/receiver_info_adding_screen.dart';
import 'package:best_seller/screens/booking/inside_screen/sender_info_adding_screen.dart';
import 'package:best_seller/screens/booking/widgets/date_in_shipping_info.dart';
import 'package:best_seller/screens/booking/widgets/drop_down_widget.dart';
import 'package:best_seller/screens/booking/widgets/recevier_address_adding_button.dart';
import 'package:best_seller/screens/booking/widgets/submit_button_in_edit_shipment.dart';
import 'package:best_seller/screens/booking/widgets/title_info_in_edit_shipment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/const.dart';
import '../widgets/floating_button.dart';
import '../widgets/sender_address_adding_button.dart';

class EditShipmentScreen extends StatelessWidget {
  EditShipmentScreen({super.key, required this.snapShot, required this.index});
  final snapShot;
  int index;
  ValueNotifier branch = ValueNotifier('');
  ValueNotifier courierCompany = ValueNotifier('');
  ValueNotifier shippingMethod = ValueNotifier('');
  ValueNotifier paymentMethod = ValueNotifier('');
  ValueNotifier status = ValueNotifier('');
  ValueNotifier collected = ValueNotifier('');
  ValueNotifier deliveryType = ValueNotifier('');
  ValueNotifier staff = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Edit ",
              style: GoogleFonts.baloo2(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: mainConColor),
            ),
            Text(
              "Shi",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "pment",
              style: GoogleFonts.baloo2(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: mainConColor,
              ),
            ),
          ],
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height / 35,
            ),
            const TitleInfoWidget(
              heading: 'Basic Info',
            ),
            Row(
              children: [
                // ShipmentTextFieldWidget(
                //     title: "Booking No.",
                //     wlength: 2.5,
                //     hintText: "TB10019",
                //     hlength: 19),
                BookingNumberInEditShipment(
                  snapShot: snapShot,
                  index: index,
                ),
                DropDownListWidget(
                  boxWidth: 2,
                  title: "Branch List",
                  hintText: "Select Branch List",
                  dropDownValue: branch,
                ),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            const Divider(),
            const TitleInfoWidget(
              heading: 'Sender Info',
            ),
            const SenderReceiverWithButtonWidget(
              dropTitle: "Sender/Customer",
              dropHint: "Select Branch List",
              textFieldTitle: "Sender Address",
              textFieldHint: "Kalamassery , ernakulam, kerala",
            ),
            SizedBox(
              height: height / 40,
            ),
            const Divider(),
            const TitleInfoWidget(
              heading: 'Receiver Info',
            ),
            const ReceiverAddressAddingBUtton(
              dropTitle: "Receiver/Customer",
              dropHint: "Select Branch List",
              textFieldTitle: "Receiver  Address",
              textFieldHint: "Kalamassery , ernakulam, kerala",
            ),
            SizedBox(
              height: height / 40,
            ),
            const Divider(),
            const TitleInfoWidget(heading: "Shipping Info"),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropDownListWidget(
                  dropDownValue: courierCompany,
                    boxWidth: 2.3,
                    title: "Courier Company",
                    hintText: "Select Courier Company"),
                DropDownListWidget(
                  dropDownValue: shippingMethod,

                    boxWidth: 2.3,
                    title: "Shipping Methods",
                    hintText: "Select Shipping Methods"),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropDownListWidget(
                  dropDownValue: paymentMethod,
                    boxWidth: 2.3,
                    title: "Payment Method",
                    hintText: "Select Payment Method"),
                DropDownListWidget(
                  
                  dropDownValue: status,
                    boxWidth: 2.3, title: "Status", hintText: "Select Status"),
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(width: width/150,),
                const DateInShippingInfo(),
                DropDownListWidget(
                  dropDownValue: collected,
                    boxWidth: 2.3, title: "Collected By", hintText: "Select"),
              ],
            ),
            SizedBox(
              height: height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                 DropDownListWidget(
                  dropDownValue: deliveryType,
                    boxWidth: 2.2,
                    title: "Delivery Type",
                    hintText: "Select Delivery Type"),
                ShipmentTextFieldWidget(
                    keyboardType: true,
                    title: "LRL Tracking Code",
                    wlength: 2.3,
                    hintText: "TB10019",
                    hlength: 19),
              ],
            ),
             Padding(
              padding: const EdgeInsets.all(15),
              child: DropDownListWidget(
                dropDownValue: staff,
                  boxWidth: 1,
                  title: "Staff Name",
                  hintText: "Select Staff Name"),
            ),
            SizedBox(
              height: height / 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SubmitButtonInEditShipment(
                  width: width,
                  height: height,
                  color: Colors.green,
                  text: "Submit",
                  function: () => submit(context),
                ),
                SubmitButtonInEditShipment(
                  width: width,
                  height: height,
                  color: Colors.red,
                  text: "Cancel",
                  function: () => cancel(context),
                )
              ],
            ),
            SizedBox(
              height: height / 10,
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButtonWidget(),
    );
  }

  submit(BuildContext context) {
    // AnimatedSnackBar.rectangle("Success", "Successfully Submitted",
    //         type: AnimatedSnackBarType.success)
    //     .show(context);
    Navigator.of(context).pop();
  }

  cancel(BuildContext context) {
    Navigator.of(context).pop();
  }
}

navigationToSenderAddressAddingScreen(BuildContext context) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      fullscreenDialog: true,
      builder: (context) => const SenderInfoAddingScreen(),
    ),
  );
}

navigationToRecevierAddressAddingScreen(BuildContext context) {
  Navigator.of(context).push(
    CupertinoPageRoute(
      fullscreenDialog: true,
      builder: (context) => const ReceiverInfoAddingScreen(),
    ),
  );
}
