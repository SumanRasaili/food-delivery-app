import 'package:flutter/material.dart';

import 'package:fooddeliveryapp/model/food.dart';

import 'package:fooddeliveryapp/model/restaurants.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurants restaurants;
  const RestaurantScreen({Key? key, required this.restaurants})
      : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItems(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(menuItem.imageUrl!), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3)
                ],
                stops: const [0.1, 0.4, 0.6, 0.9],
              ),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: <Widget>[
                Text(
                  menuItem.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: 1.2),
                ),
                Text(
                  '\$${menuItem.price}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: 1.2),
                ),
              ],
            ),
          ),
          Positioned(
            
            bottom: 10.0,
            right:10.0,
            child: Container(
           
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
         
            
          ),),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurants.imageUrl!,
                child: Image(
                  image: AssetImage(widget.restaurants.imageUrl!),
                  height: 280.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 120.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 50.0,
                      color: Colors.blue,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      iconSize: 40.0,
                      icon: const Icon(Icons.favorite_outline),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurants.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                    const Text(
                      '0.2 miles away',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: <Widget>[
                    Text(
                      widget.restaurants.address!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'contact',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22.0,
                  letterSpacing: 1.2),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: GridView.count(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurants.menu!.length,
                (index) {
                  Food food = widget.restaurants.menu![index];
                  return _buildMenuItems(food);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
