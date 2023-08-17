import 'package:best_seller/model/attendance_api_model.dart';
import 'package:best_seller/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class AttendanceProvider extends ChangeNotifier {


  late List<Datum> attendanceList = [];
  late List<Datum> filteredAttendanceList = [];
  TextEditingController searchController = TextEditingController();

   void fetchAttendanceData() async {
    Data? data = await AttendenceApi().getAllStaff();
    if (data != null && data.data.isNotEmpty) {
      attendanceList = data.data;
      filteredAttendanceList = attendanceList;
      notifyListeners();
    }
  }

   void filterAttendance(String searchTerm) {
    filteredAttendanceList = attendanceList.where((attendance) {
      final name = attendance.fullName.toLowerCase();
      return name.contains(searchTerm.toLowerCase());
    }).toList();
    notifyListeners();
  }
}
