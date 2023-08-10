// class AttendenceModel {
//   String? fullName;
//   DateTime? createdAt;

//   AttendenceModel({
//     required this.fullName,
//     required this.createdAt,
//   });
//   factory AttendenceModel.fromJson(Map<String, dynamic> json) =>
//       AttendenceModel(
//           fullName: json["full_name"],
//           createdAt: DateTime.parse(json["created_at"]));

//   Map<String, dynamic> toJson() => {
//         "full_name": fullName,
//         "created_at": createdAt,
//       };
// }
// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  List<Datum> data;

  Data({
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int userId;
  int branchId;
  String fullName;
  String staffId;
  String role;
  dynamic staffStatus;
  String fingerprint;
  String fingerprintMandatory;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Datum({
    required this.id,
    required this.userId,
    required this.branchId,
    required this.fullName,
    required this.staffId,
    required this.role,
    this.staffStatus,
    required this.fingerprint,
    required this.fingerprintMandatory,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        branchId: json["branch_id"],
        fullName: json["full_name"],
        staffId: json["staff_id"],
        role: json["role"],
        staffStatus: json["staff_status"],
        fingerprint: json["fingerprint"],
        fingerprintMandatory: json["fingerprint_mandatory"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "branch_id": branchId,
        "full_name": fullName,
        "staff_id": staffId,
        "role": role,
        "staff_status": staffStatus,
        "fingerprint": fingerprint,
        "fingerprint_mandatory": fingerprintMandatory,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
