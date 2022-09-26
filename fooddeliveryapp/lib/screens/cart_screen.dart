import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/order.dart';

import '../data/data.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(order.food!.imageUrl!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(order.food!.name!,
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4.0),
                        Text(order.restaurants!.name!,
                            style: const TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 0.8, color: Colors.black54)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Text("-",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text(order.quantity.toString(),
                                    style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600)),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Text("+",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin:const  EdgeInsets.all(10.0),
            child: Text(
              "\$${(order.quantity)! * (order.food!.price!)}",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Cart(${currentUser.cart!.length})'),
        ),
        body: ListView.separated(
            itemCount: currentUser.cart!.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.cart![index];
              return _buildCartItem(order);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 1.0,
                color: Colors.grey,
              );
            }));
  }
}
