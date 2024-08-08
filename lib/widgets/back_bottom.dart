import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';
import 'package:quote_generator_mobile_app/screens/favorite_page.dart';

class BackBottom extends StatelessWidget {
  const BackBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.KscandalColor,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          Get.back();
        },
        child: Center(
          child: Text("Click Here To View Favorite Quotes",
              style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
    );
  }
}
