import 'package:fooddeliveryapp/model/food.dart';
import 'package:fooddeliveryapp/model/order.dart';
import 'package:fooddeliveryapp/model/restaurants.dart';

import '../model/user.dart';



//Food
final _dalBhat = Food(
  imageUrl: 'assets/images/dalbhat.jpg',
  name: 'DalBhat',
  price: 200,
);

final _chhoyala = Food(
  imageUrl: 'assets/images/chhhoyalaa.jpg',
  name: 'Chhoyala',
  price: 100,
);

final _chowmein = Food(
  imageUrl: 'assets/images/chowmein.jpg',
  name: 'Chowmein',
  price: 150,
);

final _friedRice = Food(
  imageUrl: 'assets/images/fried rice.jpg',
  name: 'Fried Rice',
  price: 120,
);

final _thukpa = Food(
  imageUrl: 'assets/images/Thukpaa.jpg',
  name: 'Thukpaa',
  price: 100,
);

final _thakalikhanaset = Food(
  imageUrl: 'assets/images/thakali khana set.jpg',
  name: 'Thakali Khana Set',
  price: 300,
);
//Restaurants

final _restaurant1 = Restaurants(
  imageUrl: 'assets/images/restaurant1.jpg',
  name: 'Chef Restaurant ',
  ratings: 8,
  address: 'jamal kathmandu',
  menu: [
    _thakalikhanaset,
    _thukpa,
    _chhoyala,
    _chowmein,
    _dalBhat,
    _friedRice,
  ],
);
final _restaurant2 = Restaurants(
  imageUrl: 'assets/images/restaurant2.jpg',
  name: 'The Local Craft Food',
  ratings: 7,
  address: 'Samakhusi kathmandu',
  menu: [
    _thakalikhanaset,
    _thukpa,
    _chhoyala,
    _chowmein,
    _dalBhat,
    _friedRice,
  ],
);
final _restaurant3 = Restaurants(
  imageUrl: 'assets/images/restaurant3.jpg',
  name: 'Mughal Empire ',
  ratings: 5,
  address: 'Lazimpat,kathmandu',
  menu: [
    _thakalikhanaset,
    _thukpa,
    _chhoyala,
    _chowmein,
    _dalBhat,
    _friedRice,
  ],
);
final _restaurant4 = Restaurants(
  imageUrl: 'assets/images/restaurant4.jpg',
  name: 'Hotel Shambala ',
  ratings: 8,
  address: 'Maharajgunj  kathmandu',
  menu: [
    _thakalikhanaset,
    _thukpa,
    _chhoyala,
    _chowmein,
    _dalBhat,
    _friedRice,
  ],
);
final _restaurant5 = Restaurants(
  imageUrl: 'assets/images/restaurant5.jpg',
  name: 'Grill Durbar  ',
  ratings: 6,
  address: 'jamal  kathmandu',
  menu: [
    _thakalikhanaset,
    _thukpa,
    _chhoyala,
    _chowmein,
    _dalBhat,
    _friedRice,
  ],
);
final _restaurant6 = Restaurants(
  imageUrl: 'assets/images/restaurant6.jpg',
  name: 'Chicken Station ',
  ratings: 9,
  address: 'Swayambhu kathmandu',
  menu: [
    _thakalikhanaset,
    _thukpa,
    _chhoyala,
    _chowmein,
    _dalBhat,
    _friedRice,
  ],
);

final List<Restaurants> restaurants = [
  _restaurant1,
  _restaurant2,
  _restaurant3,
  _restaurant4,
  _restaurant5,
  _restaurant6,
];

final currentUser = User(
  name: 'Suman',
  orders: [
    Order(
      date: '2079/1/15',
      food: _chhoyala,
      restaurants: _restaurant4,
      quantity: 1,
    ),
    Order(
      date: '2079/1/17',
      food: _dalBhat,
      restaurants: _restaurant5,
      quantity: 1,
    ),
    Order(
      date: '2079/1/22',
      food: _thakalikhanaset,
      restaurants: _restaurant3,
      quantity: 1,
    ),
    Order(
      date: '2079/1/10',
      food: _friedRice,
      restaurants: _restaurant1,
      quantity: 1,
    ),
    Order(
      date: '2079/1/22',
      food: _chowmein,
      restaurants: _restaurant2,
      quantity: 1,
    ),
  ],
  
  cart: [
    Order(
      date: '2079/1/18',
      food: _dalBhat,
      restaurants: _restaurant6,
      quantity: 3,
    ),
    Order(
      date: '2079/1/20',
      food: _friedRice,
      restaurants: _restaurant5,
      quantity: 2,
    ),
  ],
);
