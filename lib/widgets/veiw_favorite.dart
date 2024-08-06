import 'package:flutter/material.dart';
import 'package:quote_generator_mobile_app/constant/colors.dart';

class VeiwFavorite extends StatelessWidget {
  const VeiwFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 90,
        ),
    
        Container(
          height: 60,
                    width: double.infinity,
        
          decoration:   BoxDecoration(
            color: AppColors.KscandalColor,
            borderRadius: BorderRadius.only(
              bottomLeft:   Radius.circular(6),
                bottomRight: Radius.circular(6),
            )
          ),
          child:  MaterialButton(
            onPressed: () {},
            child: Center(
              child: Text("Click Here To View Favorite Quotes",style: Theme.of(context).textTheme.headlineSmall
                
              ),
            ),
          ),
        ),
       
    
        Positioned(
          top: 0,
          right: 0,
          child: CircleAvatar(
            
            backgroundColor: Color.fromARGB(255, 48, 47, 47),
            child: Text('3', style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: AppColors.KwhiteColor,
            )),),
        ),
        
      ],
    );
  }
}