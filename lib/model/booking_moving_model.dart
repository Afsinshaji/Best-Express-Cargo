// To parse this JSON data, do
//
//     final moving = movingFromJson(jsonString);

import 'dart:convert';

Moving movingFromJson(String str) => Moving.fromJson(json.decode(str));

String movingToJson(Moving data) => json.encode(data.toJson());

class Moving {
    List<MovindDatum> data;

    Moving({
        required this.data,
    });

    factory Moving.fromJson(Map<String, dynamic> json) => Moving(
        data: List<MovindDatum>.from(json["data"].map((x) => MovindDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class MovindDatum {
    int id;
    dynamic name;
    String movingNumber;
    int senderId;
    int sourceCity;
    int destinationCity;
    int branchId;
    String shipingMethod;
    String paymentMethod;
    int statusId;
    DateTime createdDate;
    dynamic time;
    String collectedBy;
    int driverId;
    dynamic staffId;
    String deliveryType;
    String? totalAmount;
    dynamic totalDiscount;
    dynamic total;
    dynamic confirmedDate;
    DateTime createdAt;
    DateTime updatedAt;

    MovindDatum({
        required this.id,
        required this.name,
        required this.movingNumber,
        required this.senderId,
        required this.sourceCity,
        required this.destinationCity,
        required this.branchId,
        required this.shipingMethod,
        required this.paymentMethod,
        required this.statusId,
        required this.createdDate,
        required this.time,
        required this.collectedBy,
        required this.driverId,
        required this.staffId,
        required this.deliveryType,
        required this.totalAmount,
        required this.totalDiscount,
        required this.total,
        required this.confirmedDate,
        required this.createdAt,
        required this.updatedAt,
    });

    factory MovindDatum.fromJson(Map<String, dynamic> json) => MovindDatum(
        id: json["id"],
        name: json["name"],
        movingNumber: json["moving_number"],
        senderId: json["sender_id"],
        sourceCity: json["source_city"],
        destinationCity: json["destination_city"],
        branchId: json["branch_id"],
        shipingMethod: json["shiping_method"],
        paymentMethod: json["payment_method"],
        statusId: json["status_id"],
        createdDate: DateTime.parse(json["created_date"]),
        time: json["time"],
        collectedBy: json["collected_by"],
        driverId: json["driver_id"],
        staffId: json["staff_id"],
        deliveryType: json["delivery_type"],
        totalAmount: json["total_amount"],
        totalDiscount: json["total_discount"],
        total: json["total"],
        confirmedDate: json["confirmed_date"],
        createdAt: DateTime.parse(json["created_At"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "moving_number": movingNumber,
        "sender_id": senderId,
        "source_city": sourceCity,
        "destination_city": destinationCity,
        "branch_id": branchId,
        "shiping_method": shipingMethod,
        "payment_method": paymentMethod,
        "status_id": statusId,
        "created_date": createdDate.toIso8601String(),
        "time": time,
        "collected_by": collectedBy,
        "driver_id": driverId,
        "staff_id": staffId,
        "delivery_type": deliveryType,
        "total_amount": totalAmount,
        "total_discount": totalDiscount,
        "total": total,
        "confirmed_date": confirmedDate,
        "created_At": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
