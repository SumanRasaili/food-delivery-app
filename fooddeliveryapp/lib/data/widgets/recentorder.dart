import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/data/data.dart';
import 'package:fooddeliveryapp/model/order.dart';

class RecentOrders extends StatefulWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  State<RecentOrders> createState() => _RecentOrdersState();
}

class _RecentOrdersState extends State<RecentOrders> {
  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 345,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1.0, color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
          child:Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage(order.food!.imageUrl!),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                          margin: const EdgeInsets.all(12.0),
                          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      order.food!.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      order.restaurants!.name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      order.date!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
                        ),
              ),
            ],
          ),
          ),
          
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            width: 48.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        SizedBox(
          height: 130.0,
          child: ListView.builder(
            physics:const  BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders?.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = currentUser.orders![index];
                return _buildRecentOrder(context, order);
              }),
        )
      ],
    );
  }
}
