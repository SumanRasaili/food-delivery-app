import 'package:fooddeliveryapp/model/food.dart';

class Restaurants{
  final String? imageUrl;
  final String? name;
  final String? address;
  final int? ratings;
  final List<Food>? menu;
Restaurants({
  this.address,
  this.imageUrl,
  this.menu,
  this.name,
  this.ratings,
});

}