import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spa_and_beauty_staff/models/RequestBookingDetail.dart';

import '../main.dart';

class BookingServices {
  static final String CREATE_BOOKING_REQUEST = "https://swp490spa.herokuapp.com/api/customer/booking/create";

  static Future<String> createBookingRequest(
      List<RequestBookingDetail> listRequestBookingDetail) async {
    var jsonResponse;
    final res = await http.post(CREATE_BOOKING_REQUEST,
        headers: {
          "accept" : "application/json",
          "content-type" : "application/json",
          "authorization" : "Bearer " + MyApp.storage.getItem("token"),
        },
      body: jsonEncode(
          {
            "customerId": MyApp.storage.getItem("customerId"),
            "bookingDataList": listRequestBookingDetail
          }));
    if (res.statusCode == 200){
      jsonResponse = utf8.decode(res.bodyBytes);
      print(jsonResponse.toString());
    }
    print("LOI ROI" + "Status code = " + res.statusCode.toString());
    print("Token: " + MyApp.storage.getItem("token"));
    print("customerId: " +MyApp.storage.getItem("customerId").toString());
    print("REQUEST DATA : "+jsonEncode(
        {
        "customerId": MyApp.storage.getItem("customerId"),
        "bookingDataList": listRequestBookingDetail
        })
        );
    return res.statusCode.toString();
  }
}