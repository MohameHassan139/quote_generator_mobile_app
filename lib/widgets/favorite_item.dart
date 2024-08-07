import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';
import 'package:quote_generator_mobile_app/models/quote_model.dart';
import 'package:quote_generator_mobile_app/widgets/remove_botton.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem({
    super.key,
    required this.quote,
   
  });
  Quote quote;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.KwhiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Text(
            """${quote.content}""",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${quote.author}',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.KgreyColor,
                  ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          RemoveBotton(
            quote: quote,
          )
        ],
      ),
    );
  }
}
