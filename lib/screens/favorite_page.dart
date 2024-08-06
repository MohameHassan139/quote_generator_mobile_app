import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';

import '../widgets/favorite_item.dart';
import '../widgets/remove_botton.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const SizedBox(width: double.infinity,),
        FavoriteItem()
      ],
    );
  }
}
