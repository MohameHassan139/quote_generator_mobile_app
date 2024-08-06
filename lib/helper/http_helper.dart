import 'dart:convert';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quote_generator_mobile_app/constant/endpoint.dart';


class Http {
  // static LoginInfo? loginModel;
  static Future getQuote(
    
  ) async {
   
  
   
 
    var url = Uri.parse(ApiConstant.oneQuote);
    var response = await http.get(
      url,
   
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
   
    print(response.statusCode);

    var jsonResponse = await jsonDecode(response.body);
    return jsonResponse;
    //Or put here your next screen using Navigator.push() method
    print('success');
  }
}
