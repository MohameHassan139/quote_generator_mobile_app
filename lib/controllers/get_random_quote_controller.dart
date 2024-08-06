import 'dart:convert';

import 'package:get/get.dart';
import 'package:quote_generator_mobile_app/models/quote_model.dart';

import '../helper/http_helper.dart';

class GetRandomQuoteController extends GetxController {
  @override
  void onInit() {
    getQuote();
    super.onInit();
  }

  List<Quote>? quotes;
  Quote? quote;
  bool isloading = true;

  getQuote() async {
    try {
      var data = await Http.getQuote();
      List<Quote> quotes = Quote.fromList(data);
      quote = quotes[0];
      isloading = false;
      update();
    } catch (e) {
      print(e);
      isloading = false;
      update();
    }
  }
}
