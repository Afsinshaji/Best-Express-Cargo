import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/shipping/inside_screen_in_shipment/assigned_shipments_screen.dart';
import 'package:best_seller/screens/shipping/widgets/modal_shipment_content.dart';
import 'package:flutter/material.dart';

Future<dynamic> bottomSheetModal(BuildContext context, double screenHeight) {
    return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: screenHeight,
              decoration: const BoxDecoration(
                  color: whiteShade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  ModalShipmentWiddget(
                      firstField: "Shipment Id", secondField: "64654354"),
                  const Divider(),
                  ModalShipmentWiddget(
                      firstField: "Shipment Name", secondField: "Titanic"),
                  const Divider(),
                  ModalShipmentWiddget(
                      firstField: "Created By", secondField: "Text Staff"),
                  const Divider(),
                  ModalShipmentWiddget(
                      firstField: "Shipment Status",
                      secondField: "Shipment received"),
                  const Divider(),
                  ModalShipmentWiddget(
                      firstField: "Date", secondField: "2023-09-02"),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 3,
                    height:MediaQuery.sizeOf(context).height / 18,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const AssignedShipmentsScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: logoBlue,
                      ),
                      child: const Text(
                        "View",
                        style: TextStyle(color: whiteShade, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
  }