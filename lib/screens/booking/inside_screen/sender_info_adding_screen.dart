import 'package:best_seller/common/shipment_textfield.dart';
import 'package:best_seller/common/textfield_for_address.dart';
import 'package:best_seller/constant/const.dart';
import 'package:best_seller/functions/image_picker.dart';
import 'package:best_seller/screens/booking/widgets/drop_down_widget.dart';
import 'package:best_seller/screens/booking/widgets/submit_button_in_edit_shipment.dart';
import 'package:best_seller/screens/booking/widgets/title_info_in_edit_shipment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SenderInfoAddingScreen extends StatelessWidget {
  const SenderInfoAddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Adding Sender Info",
          style: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyLarge,
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 30,
            ),
            const TitleInfoWidget(heading: "Add Sender"),
            ShipmentTextFieldWidget(
              title: "Name",
              wlength: 0,
              hintText: "Name",
              hlength: 20,
            ),
            SizedBox(
              height: height / 100,
            ),
            ShipmentTextFieldWidget(
              title: "Email",
              wlength: 0,
              hintText: "Email",
              hlength: 20,
            ),
            SizedBox(
              height: height / 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: width*0.01,),
                 const DropDownListWidget(
                     boxWidth:  2.2,
                     title: "Sender Identification Type",
                     hintText: "Identification Type"),
                ShipmentTextFieldWidget(
                    title: "Sender Id",
                    wlength: 2.5,
                    hintText: "Document Id",
                    hlength: 20),
              ],
            ),
            SizedBox(
              height: height / 40,
            ),
            Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: width / 8,
                ),
                Column(
                  children: [
                    Text(
                      " Upload Document",
                      style: GoogleFonts.sora(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: logoRed)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Map<Permission, PermissionStatus> statuses = await [
                        //   Permission.storage,
                        //   Permission.camera,
                        // ].request();
                        // if (statuses[Permission.storage]!.isGranted &&
                        //     statuses[Permission.camera]!.isGranted) {
                        //   ImagePickerClass().showBottomSheetWidget(context);
                        // } else {
                        //   AnimatedSnackBar.rectangle("Permission Denied",
                        //       "Permission where Denied by the user",
                        //       type: AnimatedSnackBarType.warning);
                        // }
                        // ImagePickerClass().pickingImage();
                        ImagePickerClass().showBottomSheetWidget(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Choose File",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: width / 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: height / 22,
                    width: width / 2,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Center(
                      child: Text("No file Choosen"),
                    ),
                  ),
                ),
              ],
            ),
            const TitleInfoWidget(heading: "Add Address"),
            const SizedBox(
              height: 5,
            ),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                DropDownListWidget(
                    boxWidth: 2.2,
                    title: "Country",
                    hintText: "Select Country"),
                DropDownListWidget(
                    boxWidth: 2.2, title: "State", hintText: "Select State"),
              ],
            ),
            // SizedBox(
            //       height: height / 60,
            //     ),
             const Padding(
              padding: EdgeInsets.all(15),
              child: DropDownListWidget(
                  boxWidth:  1, title: "City", hintText: "Select City"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width*0.03,),
                 const DropDownListWidget(
                    boxWidth:  4, title: "Code", hintText: "code"),
                ShipmentTextFieldWidget(
                  keyboardType: true,
                    title: "Whatsapp number",
                    wlength: 1.6,
                    hintText: "Enter 9 digits",
                    hlength: 20),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width*0.03,),
                 const DropDownListWidget(
                    boxWidth:  4, title: "Code", hintText: "code"),
                ShipmentTextFieldWidget(
                  keyboardType: true,
                    title: "Phone",
                    wlength: 1.6,
                    hintText: "Enter 9 digits",
                    hlength: 20),
              ],
            ),
            ShipmentTextFieldWidget(
              keyboardType: true,
                title: "Pin Code",
                wlength: 1,
                hintText: "Pin Code",
                hlength: 20),

            TextFieldForAddress(
                title: "Address ", wlength: 1, hintText: "Address", hlength: 7),
                SizedBox(height: height/22,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SubmitButtonInEditShipment(
                  width: width,
                  height: height,
                  color: Colors.green,
                  text: "Save",
                  function: () => Navigator.of(context).pop(),
                ),
                SubmitButtonInEditShipment(
                  width: width,
                  height: height,
                  color: Colors.red,
                  text: "Cancel",
                  function: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SizedBox(
              height: height / 15,
            )
          ],
        ),
      ),
    );
  }
}
