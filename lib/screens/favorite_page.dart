import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';
import 'package:quote_generator_mobile_app/controllers/favorite_controller.dart';

import '../widgets/back_bottom.dart';
import '../widgets/custom_textformfield.dart';
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
            child: Column(
              children: [
                const BackBottom(),
                const SizedBox(
                  height: 8,
                ),
                GetBuilder<QuoteController>(builder: (_) {
                  return CustomTextFormField(
                    hintText: 'Type Something Here To Search..',

                    textController: quoteController.searchController,
                    suffix: (quoteController.searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              quoteController.searchController.clear();
                            },
                            icon: const Icon(Icons.cancel_outlined))
                        : null),
                    onChange: (query) {
                      quoteController.searchQuotes(query);
                    },
                    //  suffix: ,
                  );
                }),
                const SizedBox(
                  height: 8,
                ),
                GetBuilder<QuoteController>(builder: (_) {
                  return Visibility(
                    visible: quoteController.searchController.text.isEmpty,
                    replacement: SearchList(),
                    child: FavoriteList(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  SearchList({
    super.key,
  });

  final QuoteController quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        var quotes = quoteController.searchResults.isEmpty
            ? quoteController.quotes
            : quoteController.searchResults;

        return ListView.separated(
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            var quote = quotes[index];
            return FavoriteItem(
              quote: quote,
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 12,
          ),
        );
      }),
    );
  }
}

class FavoriteList extends StatelessWidget {
  FavoriteList({
    super.key,
  });

  final QuoteController quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuoteController>(builder: (_) {
      return Expanded(
        child: ListView.separated(
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
        ),
      );
    });
  }
}
