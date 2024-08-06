import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';
import 'package:quote_generator_mobile_app/widgets/remove_botton.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
  });

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
          Text("""“All I required to be happy was friendship and people I could admire.”"""
              ,
              style: Theme.of(context).textTheme.headlineSmall,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "- Mark Twain",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColors.KgreyColor,
              ),
            ),
          ),
              const SizedBox(
            height: 12,
          ),
          RemoveBotton()
        ],
      ),
    );
  }
}
