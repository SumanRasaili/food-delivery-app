import 'order.dart';

class User{
  final String? name;
  final List<Order>? cart;
  final List<Order>? orders;
  User({ 
    this.cart,
    this.name,
    this.orders,
  });
}