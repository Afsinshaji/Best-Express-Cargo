import 'dart:convert';
import 'dart:developer';

import 'package:best_seller/model/attendance_api_model.dart';
import 'package:http/http.dart' as http;

// class AttendenceApi {
//   String baseUrl = "https://bestexpress.vahid.tech/api/getStaffApi";

//   Future<List> getAllStaff() async {
//     try {
//       var response = await http.get(Uri.parse(baseUrl));
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return jsonDecode(response.body);
//       } else {
//         return Future.error("Server error");
//       }
//     } catch (e) {
//       return Future.error(e);
//     }
//   }
// }

class AttendenceApi {
  // Future<Data>? getAllStaff() async {
  //   Data? attendanceList;
  //   final response = await http.get(
  //     Uri.parse("https://bestexpress.vahid.tech/api/getStaffById"),
  //   );
  //   if (response.statusCode == 200) {
  //     try {
  //       final jsonData = json.decode(response.body);
  //       // attendanceList = List<Data>.from(jsonData.map((x) => Data.fromJson(x)));
  //       attendanceList = Data.fromJson(jsonData);
  //     } catch (e) {
  //       log("Error : $e");
  //     }
  //   } else {
  //     log("Error of fetching");
  //   }
  //   for (var i = 0; i < attendanceList!.data.length; i++) {
  //     log(attendanceList.data[i].fullName);
  //   }

  //   return attendanceList;
  // }


  // void loginApi(
  //   TextEditingController controllerEmail,
  //   TextEditingController controllerPassword,
  //   SharedPreferences prefs,
  //   BuildContext context,
  // ) async {
  //   if (controllerEmail.text.isNotEmpty && controllerPassword.text.isNotEmpty) {
  //     var reqBody = {
  //       "email": controllerEmail.text,
  //       "password": controllerPassword.text,
  //     };
  //     try {
  //       var response = await http.post(
  //         Uri.parse("https://bestexpress.vahid.tech/api/login"),
  //         headers: {'Content-Type': 'application/json'},
  //         body: jsonEncode(reqBody),
  //       );

  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         var jsonResponse = jsonDecode(response.body);

  //         // if (jsonResponse['status'] == false) {
  //         var myToken = jsonResponse['token'];
  //         prefs.setString('token', myToken);

  //         // ignore: use_build_context_synchronously
  //         // Navigator.of(context).pushReplacement(
  //         //   MaterialPageRoute(
  //         //     builder: (context) => DashBoardScreen(token: myToken),
  //         //   ),
  //         // );
  //         // } else {
  //         //   // final snackBar = SnackBar(
  //         //   //   content: Text("Login failed: ${jsonResponse['message']}"),
  //         //   // );
  //         //   final snackBar = SnackBar(
  //         //     content: Text("Login failed: ${jsonResponse['token'].toString()}"),
  //         //   );
  //         //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //         // }
  //       } else {
  //         final snackBar = SnackBar(
  //           content: Text("Error: ${response.reasonPhrase}"),
  //         );
  //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       }
  //     } catch (e) {
  //       print("Error during login: $e");
  //     }
  //   }
  // }
}
