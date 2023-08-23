import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:best_seller/model/booking_api_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingProvider extends ChangeNotifier {
  Future<List<BookingData>> bookingResponse(BuildContext context) async {
    // final bId = Provider.of<AuthStateManagement>(context).branch_id;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String myTokenfront = prefs.getString('token')!;
    String branchId = prefs.getString('branch_id')!;

    List<BookingData> dataListBooking = [];
  log(" from out side of try");
    try {
      log(" from in side of try");
      final response = await http.get(
        Uri.parse(
            'https://bestexpress.vahid.tech/api/getBooking?branch_id=$branchId'),
        headers: {'Authorization': 'Bearer $myTokenfront'},
      );
      // log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        //  log(response.body.toString());
        // log(dataMapList.toString());

        Booking dataListvar = Booking.fromJson(responseData);
        // log(dataListvar.data.toString());

        List<BookingData> extractedDatumList = dataListvar.data;
            log("Outside of for");
        for (BookingData datum in extractedDatumList) {
          dataListBooking.add(datum);
          log("hey");
          // log(dataListBooking[0].agencyId.toString());
        }
      } else {
        debugPrint("In response else");
      }
    } catch (e) {
      log("Error in fetchStaffById: $e");
      throw e;
    }
    // notifyListeners();
    return dataListBooking;
  }
}
