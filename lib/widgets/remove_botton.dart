import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';
import 'package:quote_generator_mobile_app/controllers/favorite_controller.dart';
import 'package:quote_generator_mobile_app/models/quote_model.dart';

class RemoveBotton extends StatelessWidget {
  RemoveBotton({
    super.key,
    required this.quote,
  });
  Quote quote;
  final QuoteController quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
          border: Border.all(
            color: AppColors.KprimaryColor,
            width: 2.5,
          )),
      child: MaterialButton(
        onPressed: () {
          quoteController.removeQuote(quote: quote);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_border,
              color: AppColors.KprimaryColor,
              size: 32,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Remove From Favorite",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.KprimaryColor,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
