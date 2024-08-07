import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';
import 'package:quote_generator_mobile_app/controllers/get_random_quote_controller.dart';

import '../widgets/veiw_favorite.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  GetRandomQuoteController getRandomQuoteController =
      Get.put(GetRandomQuoteController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        VeiwFavorite(),
        const SizedBox(
          height: 12,
        ),
        GetBuilder<GetRandomQuoteController>(builder: (_) {
          if (getRandomQuoteController.isloading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.KwhiteColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
            child: Column(
              children: [
                Text(
                  """${getRandomQuoteController.quote?.content}""",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    """${getRandomQuoteController.quote?.author}""",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.KgreyColor,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 48,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                        ),
                        color: AppColors.KprimaryColor,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          getRandomQuoteController.getQuote();
                        },
                        child: Text(
                          "Generate Another Quote",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: AppColors.KwhiteColor,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(6),
                          ),
                          border: Border.all(
                            color: AppColors.KprimaryColor,
                            width: 2.5,
                          )),
                      child: MaterialButton(
                        onPressed: () {
                          getRandomQuoteController.addQuoteToFovirt();
                        },
                        child: const Icon(
                          Icons.favorite,
                          color: AppColors.KprimaryColor,
                          size: 32,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }),
      ],
    );
  }
}
