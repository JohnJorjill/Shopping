import 'package:shop_cart_app/models/item.dart';

class Order{
  final List<Item> items;
  final int orderId;

  Order({this.items, this.orderId});

}