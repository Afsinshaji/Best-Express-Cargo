// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
    List<BookingData> data;

    Booking({
        required this.data,
    });

    factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        data: List<BookingData>.from(json["data"].map((x) => BookingData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class BookingData {
    int id;
    String bookingNumber;
    int? agencyId;
    int statusId;
    int senderId;
    int receiverId;
    dynamic companyId;
    int branchId;
    dynamic prevBranchId;
    int? driverId;
    int? staffId;
    int createdBy;
    dynamic updatedBy;
    DateTime shipingDate;
    dynamic receiptNumber;
    dynamic packingType;
    String? courierCompany;
    String shipingMethod;
    PaymentMethod paymentMethod;
    int paymentStatus;
    int numberOfPcs;
    dynamic weight;
    dynamic rate;
    String? packingCharge;
    String otherCharges;
    String discount;
    dynamic totalAmount;
    dynamic length;
    dynamic width;
    dynamic height;
    dynamic barcode;
    dynamic date;
    dynamic trackingUrl;
    DateTime createdDate;
    dynamic shippingMethodId;
    String? lrlTrackingCode;
    String? normalWeight;
    String? rateNormalWeight;
    String? amountNormalWeight;
    String? electronicsWeight;
    String? rateElectronicsWeight;
    String? amountElectronicsWeight;
    String? rateMsicWeight;
    String? amountMsicWeight;
    String? otherWeight;
    String? rateOtherWeight;
    String? amountOtherWeight;
    String grandTotalWeight;
    dynamic rateGrandTotal;
    String? amountGrandTotal;
    String? msicWeight;
    dynamic grandTotalBoxValue;
    String? totalFreight;
    dynamic miscFreight;
    String documentCharge;
    String? grandTotal;
    dynamic packageTotalAmount;
    dynamic packageTotalQuantity;
    dynamic shipId;
    CollectedBy collectedBy;
    String? deliveryType;
    String? commentBox;
    dynamic time;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    Driver? driver;

    BookingData({
        required this.id,
        required this.bookingNumber,
        required this.agencyId,
        required this.statusId,
        required this.senderId,
        required this.receiverId,
        required this.companyId,
        required this.branchId,
        required this.prevBranchId,
        required this.driverId,
        required this.staffId,
        required this.createdBy,
        required this.updatedBy,
        required this.shipingDate,
        required this.receiptNumber,
        required this.packingType,
        required this.courierCompany,
        required this.shipingMethod,
        required this.paymentMethod,
        required this.paymentStatus,
        required this.numberOfPcs,
        required this.weight,
        required this.rate,
        required this.packingCharge,
        required this.otherCharges,
        required this.discount,
        required this.totalAmount,
        required this.length,
        required this.width,
        required this.height,
        required this.barcode,
        required this.date,
        required this.trackingUrl,
        required this.createdDate,
        required this.shippingMethodId,
        required this.lrlTrackingCode,
        required this.normalWeight,
        required this.rateNormalWeight,
        required this.amountNormalWeight,
        required this.electronicsWeight,
        required this.rateElectronicsWeight,
        required this.amountElectronicsWeight,
        required this.rateMsicWeight,
        required this.amountMsicWeight,
        required this.otherWeight,
        required this.rateOtherWeight,
        required this.amountOtherWeight,
        required this.grandTotalWeight,
        required this.rateGrandTotal,
        required this.amountGrandTotal,
        required this.msicWeight,
        required this.grandTotalBoxValue,
        required this.totalFreight,
        required this.miscFreight,
        required this.documentCharge,
        required this.grandTotal,
        required this.packageTotalAmount,
        required this.packageTotalQuantity,
        required this.shipId,
        required this.collectedBy,
        required this.deliveryType,
        required this.commentBox,
        required this.time,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.driver,
    });

    factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        id: json["id"],
        bookingNumber: json["booking_number"],
        agencyId: json["agency_id"],
        statusId: json["status_id"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        companyId: json["company_id"],
        branchId: json["branch_id"],
        prevBranchId: json["prev_branch_id"],
        driverId: json["driver_id"],
        staffId: json["staff_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        shipingDate: DateTime.parse(json["shiping_date"]),
        receiptNumber: json["receipt_number"],
        packingType: json["packing_type"],
        courierCompany: json["courier_company"],
        shipingMethod: json["shiping_method"],
        paymentMethod: paymentMethodValues.map[json["payment_method"]]!,
        paymentStatus: json["payment_status"],
        numberOfPcs: json["number_of_pcs"],
        weight: json["weight"],
        rate: json["rate"],
        packingCharge: json["packing_charge"],
        otherCharges: json["other_charges"],
        discount: json["discount"],
        totalAmount: json["total_amount"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        barcode: json["barcode"],
        date: json["date"],
        trackingUrl: json["tracking_url"],
        createdDate: DateTime.parse(json["created_date"]),
        shippingMethodId: json["shipping_method_id"],
        lrlTrackingCode: json["lrl_tracking_code"],
        normalWeight: json["normal_weight"],
        rateNormalWeight: json["rate_normal_weight"],
        amountNormalWeight: json["amount_normal_weight"],
        electronicsWeight: json["electronics_weight"],
        rateElectronicsWeight: json["rate_electronics_weight"],
        amountElectronicsWeight: json["amount_electronics_weight"],
        rateMsicWeight: json["rate_msic_weight"],
        amountMsicWeight: json["amount_msic_weight"],
        otherWeight: json["other_weight"],
        rateOtherWeight: json["rate_other_weight"],
        amountOtherWeight: json["amount_other_weight"],
        grandTotalWeight: json["grand_total_weight"],
        rateGrandTotal: json["rate_grand_total"],
        amountGrandTotal: json["amount_grand_total"],
        msicWeight: json["msic_weight"],
        grandTotalBoxValue: json["grand_total_box_value"],
        totalFreight: json["total_freight"],
        miscFreight: json["misc_freight"],
        documentCharge: json["document_charge"],
        grandTotal: json["grand_total"],
        packageTotalAmount: json["package_total_amount"],
        packageTotalQuantity: json["package_total_quantity"],
        shipId: json["ship_id"],
        collectedBy: collectedByValues.map[json["collected_by"]]!,
        deliveryType: json["delivery_type"],
        commentBox: json["comment_box"],
        time: json["time"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        driver: json["driver"] == null ? null : Driver.fromJson(json["driver"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "booking_number": bookingNumber,
        "agency_id": agencyId,
        "status_id": statusId,
        "sender_id": senderId,
        "receiver_id": receiverId,
        "company_id": companyId,
        "branch_id": branchId,
        "prev_branch_id": prevBranchId,
        "driver_id": driverId,
        "staff_id": staffId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "shiping_date": "${shipingDate.year.toString().padLeft(4, '0')}-${shipingDate.month.toString().padLeft(2, '0')}-${shipingDate.day.toString().padLeft(2, '0')}",
        "receipt_number": receiptNumber,
        "packing_type": packingType,
        "courier_company": courierCompany,
        "shiping_method": shipingMethod,
        "payment_method": paymentMethodValues.reverse[paymentMethod],
        "payment_status": paymentStatus,
        "number_of_pcs": numberOfPcs,
        "weight": weight,
        "rate": rate,
        "packing_charge": packingCharge,
        "other_charges": otherCharges,
        "discount": discount,
        "total_amount": totalAmount,
        "length": length,
        "width": width,
        "height": height,
        "barcode": barcode,
        "date": date,
        "tracking_url": trackingUrl,
        "created_date": createdDate.toIso8601String(),
        "shipping_method_id": shippingMethodId,
        "lrl_tracking_code": lrlTrackingCode,
        "normal_weight": normalWeight,
        "rate_normal_weight": rateNormalWeight,
        "amount_normal_weight": amountNormalWeight,
        "electronics_weight": electronicsWeight,
        "rate_electronics_weight": rateElectronicsWeight,
        "amount_electronics_weight": amountElectronicsWeight,
        "rate_msic_weight": rateMsicWeight,
        "amount_msic_weight": amountMsicWeight,
        "other_weight": otherWeight,
        "rate_other_weight": rateOtherWeight,
        "amount_other_weight": amountOtherWeight,
        "grand_total_weight": grandTotalWeight,
        "rate_grand_total": rateGrandTotal,
        "amount_grand_total": amountGrandTotal,
        "msic_weight": msicWeight,
        "grand_total_box_value": grandTotalBoxValue,
        "total_freight": totalFreight,
        "misc_freight": miscFreight,
        "document_charge": documentCharge,
        "grand_total": grandTotal,
        "package_total_amount": packageTotalAmount,
        "package_total_quantity": packageTotalQuantity,
        "ship_id": shipId,
        "collected_by": collectedByValues.reverse[collectedBy],
        "delivery_type": deliveryType,
        "comment_box": commentBox,
        "time": time,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "driver": driver?.toJson(),
    };
}

enum CollectedBy {
    DRIVER,
    STAFF
}

final collectedByValues = EnumValues({
    "driver": CollectedBy.DRIVER,
    "staff": CollectedBy.STAFF
});

class Driver {
    int id;
    int userId;
    String name;
    String mobile;
    String vehicleNumber;

    Driver({
        required this.id,
        required this.userId,
        required this.name,
        required this.mobile,
        required this.vehicleNumber,
    });

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        mobile: json["mobile"],
        vehicleNumber: json["vehicle_number"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "mobile": mobile,
        "vehicle_number": vehicleNumber,
    };
}

enum PaymentMethod {
    CASH_PAYMENT
}

final paymentMethodValues = EnumValues({
    "cash_payment": PaymentMethod.CASH_PAYMENT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
