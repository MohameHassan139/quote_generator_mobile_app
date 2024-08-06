import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';

class RemoveBotton extends StatelessWidget {
  const RemoveBotton({
    super.key,
  });

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
        )
        ),
        child: MaterialButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.favorite_border, color: AppColors.KprimaryColor,size: 32,),
              const SizedBox(width: 4,),
              Text("Remove From Favorite",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: AppColors.KprimaryColor,
              ),)
            ],
          ),
        ),
    );
  }
}