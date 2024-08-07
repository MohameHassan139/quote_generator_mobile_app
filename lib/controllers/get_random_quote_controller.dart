import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:quote_generator_mobile_app/models/quote_model.dart';

import '../helper/http_helper.dart';

class GetRandomQuoteController extends GetxController {
  Box<Quote>? quotesBox;
  RxInt quotelength = 0.obs;
  @override
  void onInit() {
    getQuote();
    Hive.openBox<Quote>('quotes').then((box) {
      quotesBox = box;
      quotelength(quotesBox?.length);
      update();
    });
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

  Future<void> addQuoteToFovirt() async {
    try {
      await quotesBox?.put(quote!.id, quote!);
      quotelength++;
      update();
    } catch (e) {
      print(e.toString());
      update();
    }
  }
}
