import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../models/quote_model.dart';
import 'get_random_quote_controller.dart';

class QuoteController extends GetxController {
  var quotes = <Quote>[].obs;
  var isLoading = true.obs;
  var searchResults = <Quote>[].obs;
  var searchController = TextEditingController();
  final GetRandomQuoteController controller =
      Get.put(GetRandomQuoteController());
  @override
  void onInit() {
    fetchQuotesFromHive();
    super.onInit();
  }

  Future<void> fetchQuotesFromHive() async {
    var box = await Hive.openBox<Quote>('quotes');

    quotes.assignAll(box.values.toList());
  }

  Future<void> removeQuote({required Quote quote}) async {
    try {
      var box = await Hive.openBox<Quote>('quotes');
      box.delete(quote.id);
      searchResults.remove(quote);
      quotes.remove(quote);
      controller.quotelength.value--;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  void searchQuotes(String query) {
    var results = quotes.where((quote) {
      return quote.content!.toLowerCase().contains(query.toLowerCase()) ||
          quote.author!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    searchResults.assignAll(results);

    update();
  }
}
