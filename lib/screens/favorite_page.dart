import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';
import 'package:quote_generator_mobile_app/controllers/favorite_controller.dart';

import '../widgets/favorite_item.dart';
import '../widgets/remove_botton.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});
  final QuoteController quoteController = Get.put(QuoteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.KscafflodBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: GetBuilder<QuoteController>(builder: (_) {
              return ListView.separated(
                itemCount: quoteController.quotes.length,
                itemBuilder: (context, index) {
                  var quote = quoteController.quotes[index];
                  return FavoriteItem(
                    quote: quote,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 12,
                ),
              );
            }),
          ),
        ),
      ),
    );
    // return Column(

    //   children: [
    //     const SizedBox(width: double.infinity,),
    //     FavoriteItem()
    //   ],
    // );
  }
}
