import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spa_and_beauty_staff/models/ConsultantProfileToChat.dart';
import 'package:spa_and_beauty_staff/models/CustomerProfile.dart';

import '../main.dart';

class ConsultantProfileServices {

  static final String urlGetConsultantProfileToChat = "https://swp490spa.herokuapp.com/api/customer/getListConsultantForChat?customerId=";

  static Future<ConsultantProfileToChat> getConsultantProfileToChat(customerId) async {
    try{
      final response = await http.get(urlGetConsultantProfileToChat + customerId.toString(),
          headers: {
            "authorization": "Bearer " + MyApp.storage.getItem("token"),
          });
      print("Status: " + response.statusCode.toString());
      if(200 == response.statusCode){
        final ConsultantProfileToChat consultantProfileToChat = consultantProfileToChatFromJson(utf8.decode(response.bodyBytes));
        return consultantProfileToChat;
      }else{
        return ConsultantProfileToChat();
      }
    }catch(e){
      return ConsultantProfileToChat();
    }
  }
}