

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/data/widgets/recentorder.dart';
import 'package:fooddeliveryapp/model/restaurants.dart';
import 'package:fooddeliveryapp/screens/restaurant_screen.dart';

import '../data/data.dart';
import '../data/widgets/rating_stars.dart';
import 'cart_screen.dart';


class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

_buildRestaurants(){
  List<Widget> restaurantList = [];
  restaurants.forEach((Restaurants restaurants){
    restaurantList.add( 
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> RestaurantScreen(restaurants: restaurants,)),);
        },
        child: Container( 
          margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
          
         
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all( 
            width: 1.0,
            color: Colors.grey,
          ),
          ),
          child:Row(  
            children: <Widget>[ 
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurants.imageUrl!,
                    child: Image(
                      height: 150.0,
                      width: 150.0,
                      image: AssetImage(restaurants.imageUrl!),
                     fit: BoxFit.cover,),
                  ),
                ),
              ),
              Container(  
                margin:const  EdgeInsets.all(10.0),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[ 
                    Text(restaurants.name!, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),overflow: TextOverflow.ellipsis,),
                    RatingStars(rating:4),
                    const SizedBox(height: 4.0,),
                    Text(restaurants.address!, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4.0,),
                    const Text('0.2 miles Away', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
            
          ), 
        ),
      ),
    );
  });
   return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch, 
    children: restaurantList,
  );

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const  Text('Food Delivery'),
        leading:
             IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: (){},
            iconSize: 40.0,
            ),
            actions: <Widget> [ 
              TextButton(               
              child: Text('Cart(${currentUser.cart!.length})',style: const TextStyle(color: Colors.white,fontSize: 20),),
              onPressed: (){ 
                Navigator.push(
                  context, MaterialPageRoute(builder: (_)=>const  CartScreen()),);
              },    
              ),
              
            ],
          
      ),
      body: ListView(  
          children:<Widget>  [ 
            Padding(
              
              padding:const EdgeInsets.all(20.0),
              child: TextField( 
                decoration: InputDecoration(
                  contentPadding:const  EdgeInsets.symmetric(vertical:15.0 ),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(width: 0.8),
                    
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(width: 0.8 ,color: Theme.of(context).primaryColor),
                    
                ),
                hintText: 'Search Food or Restaurants',
                prefixIcon: const Icon(Icons.search,size: 30.0,),
                suffixIcon: IconButton(icon: const Icon(Icons.clear,size:30.0),
                onPressed: (){                 
                  print('Clear Button is clicked');
                }
                ),       
                ),
                ),
            ),
             const RecentOrders(),
             Column( 
               
              crossAxisAlignment: CrossAxisAlignment.start,
               children:  <Widget>[ 
                 
                const  Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20.0),
                   child: Text(
                     'Nearby Restaurants',
                     style: TextStyle(
                       fontWeight: FontWeight.w600,fontSize: 20,letterSpacing: 1.2
                       ),
                       ),
                 ),
                 _buildRestaurants(),
                 
               ],
             ), 
          ],    
        ),   
    );
  }
}
