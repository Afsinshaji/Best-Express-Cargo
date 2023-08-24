import 'dart:convert';
import 'dart:developer';

import 'package:best_seller/model/booking_moving_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class BookingMovingProvider extends ChangeNotifier {

  Future<List<MovindDatum>> movingResponse(BuildContext context) async {
    // final bId = Provider.of<AuthStateManagement>(context).branch_id;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String myTokenfront = prefs.getString('token')!;
    String branchId = prefs.getString('branch_id')!;

    List<MovindDatum> dataListBooking = [];
  log(" from out side of moving try");
    try {
      log(" from in side of  moving try");
      final response = await http.get(
        Uri.parse(
            'https://bestexpress.vahid.tech/api/getAllMoving?branch_id=$branchId'),
        headers: {'Authorization': 'Bearer $myTokenfront'},
      );
      
      // log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        //  log(response.body.toString());
        // log(dataMapList.toString());

        Moving dataListvar = Moving.fromJson(responseData);
        // log(dataListvar.data.toString());

        List<MovindDatum> extractedDatumList = dataListvar.data;
            log("Outside of for moving");
        for (MovindDatum datum in extractedDatumList) {
          dataListBooking.add(datum);
          log("hey moving");
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