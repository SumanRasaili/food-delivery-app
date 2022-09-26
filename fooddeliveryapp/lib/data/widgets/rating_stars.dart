
import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {


 final  int rating;
   RatingStars({ Key? key,required this.rating }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stars ='';
    for(int i=0;i<rating ; i++){
      stars +='U+2606';

    }
    return Text(stars);
      
    
  }
}