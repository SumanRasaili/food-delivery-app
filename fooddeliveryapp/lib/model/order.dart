import 'package:fooddeliveryapp/model/food.dart';
import 'package:fooddeliveryapp/model/restaurants.dart';

class Order{
  final Restaurants? restaurants;
  final Food? food;
  final String? date;
  final int? quantity;

  Order({
this.restaurants,
this.food,
this.date,
this.quantity,
  });
}