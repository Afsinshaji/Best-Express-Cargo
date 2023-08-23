import 'dart:convert';
import 'dart:developer';

import 'package:best_seller/model/attendance_api_model.dart';
import 'package:best_seller/providers/auth_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AttendanceProvider extends ChangeNotifier {
  late List<Datum> attendanceList = [];
  late List<Datum> filteredAttendanceList = [];
  TextEditingController searchController = TextEditingController();
  Dio dio = Dio();
  String? myTokenfront;
  String? get myToken => myTokenfront;

  // void fetchAttendanceData() async {
  //   Data? data = await AttendenceApi().getAllStaff();
  //   if (data != null && data.data.isNotEmpty) {
  //     attendanceList = data.data;
  //     filteredAttendanceList = attendanceList;
  //     notifyListeners();
  //   }
  // }

  void filterAttendance(String searchTerm) {
    filteredAttendanceList = attendanceList.where((attendance) {
      final name = attendance.fullName.toLowerCase();
      return name.contains(searchTerm.toLowerCase());
    }).toList();
    notifyListeners();
  }

  // Future<Response> getBranchId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   myTokenfront = prefs.getString('token');
  //   final response
  // }

  // Future<List<Datum>> fetchStaffById(BuildContext context) async {
  //   final bId = Provider.of<AuthStateManagement>(context).branch_id;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String myTokenfront = prefs.getString('token')!;

  //   List<Datum> dataList = [];

  //   try {
  //     var response = await dio.get(
  //       'https://bestexpress.vahid.tech/api/getAllStaff',
  //       queryParameters: {'branch_id': bId},
  //       options: Options(headers: {'Authorization': 'Bearer $myTokenfront'}),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       log("branch in res $bId");
  //       // log('This is the id ${response.data}');

  //       List dataMapList = response.data['data'];

  //       for (var dataMap in dataMapList) {
  //         Datum datum = Datum.fromJson(dataMap);
  //         dataList.add(datum);
  //         log('List data ${dataList.toString()}');
  //       }
  //     } else {
  //       log("In response else");
  //     }
  //   } catch (e) {
  //     log("Error in fetchStaffById: $e");
  //     throw e;
  //   }

  //   return dataList;
  // }

  Future httpGetAllStaff() async {}

  List<Datum> getDataList = [];
  var user;

  Future<List<Datum>> getData(BuildContext context) async {
    final bId = Provider.of<AuthStateManagement>(context).branch_id;

    var client = http.Client();
    var url = 'https://bestexpress.vahid.tech/api/getAllStaff?branch_id=$bId';
    var uri = Uri.parse(url);
    final response = await client
        .get(uri, headers: {'Authorization': 'Bearer $myTokenfront'});
    var data = response.body;
    log(response.body);
    var decodeddata = jsonDecode(data.toString());
    // user = GetMethod.fromJson(response.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in decodeddata) {
        getDataList.add(Datum.fromJson(index));
        // user = GetMethod.fromJson(index);
      }
      return getDataList;
    } else {
      notifyListeners();
      return getDataList;
    }
    
  }

  //*********************************** */ chat Gpt coverted code to http *********************************

 Future<List<Datum>> httpCovertedCode(BuildContext context) async {
  // final bId = Provider.of<AuthStateManagement>(context).branch_id;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String myTokenfront = prefs.getString('token')!;
  String bId = prefs.getString('branch_id')!;

  List<Datum> dataList = [];

  try {
    final response = await http.get(
      Uri.parse('https://bestexpress.vahid.tech/api/getAllStaff?branch_id=$bId'),
      headers: {'Authorization': 'Bearer $myTokenfront'},
    );

    if (response.statusCode == 200 ) {
      final Map<String, dynamic> responseData = json.decode(response.body);
    
      // log(responseData.toString());
      // log(dataMapList.toString());
      DataList dataListvar =  DataList.fromJson(responseData);

List<Datum> extractedDatumList = dataListvar.data;



for (Datum datum in extractedDatumList) {
  dataList.add(datum);
}

  //     for (Map<String,dynamic> data in dataMapList) {
  //     DataList fullData=  DataList.fromJson(data);
  //   dataList.add(fullData);
    
  //   log(dataList[0].toString());
  //   log(dataList[1].toString());
    
  // }
 
      // dataList.addAll(dataMapList);3
//  for ( var dataMap in dataMapList) {
//           // Datum datum = Datum.fromJson(dataMap);
//       final Data dataObject = Data.fromJson(dataMap);
//       dataList.add(dataObject);
//           // dataList.add(datum);
//         }
          // log('List data ${dataList[0]..toString()}');

      // return dataList;
    } else {
      debugPrint("In response else");
    }
  } catch (e) {
    debugPrint("Error in fetchStaffById: $e");
    throw e;
  }

  return dataList;
}

  
}
