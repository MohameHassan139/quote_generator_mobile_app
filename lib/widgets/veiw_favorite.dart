import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';

import '../controllers/get_random_quote_controller.dart';
import '../screens/favorite_page.dart';

class VeiwFavorite extends StatelessWidget {
  VeiwFavorite({
    super.key,
  });
  GetRandomQuoteController getRandomQuoteController =
      Get.put(GetRandomQuoteController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const SizedBox(
          height: 90,
        ),
        Container(
          height: 60,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.KscandalColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              )),
          child: MaterialButton(
            onPressed: () {
              Get.to(FavoritePage());
            },
            child: Center(
              child: Text("Click Here To View Favorite Quotes",
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 48, 47, 47),
            child: Obx(() {
        
              var box = getRandomQuoteController.quotelength.value;
              return Text(
                '${box ?? 0}',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.KwhiteColor,
                    ),
              );
            }),
          ),
        ),
        
      ],
    );
  }
}
