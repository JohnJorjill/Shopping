import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shop_cart_app/items_list.dart';

import 'models/item.dart';

class ItemsScreen extends StatefulWidget {
  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  // STATE
  List<Item> itemsList = [];

  // CONTROLLERS

  void getData() async {
    Response response = await get('http://localhost:3000/api/items');
    String data = response.body;

    iterateJson(data);
  }

  void iterateJson(String jsonStr) {
    var itemId;
    var itemPrice;
    var itemName;

    List<dynamic> items = json.decode(jsonStr);

    items.forEach((item) {
      (item as Map<String, dynamic>).forEach((key, value) {
        if (key == "itemId") {
          itemId = value;
        }
        if (key == "itemName") {
          itemName = value;
        }
        if (key == "itemPrice") {
          itemPrice = value;
        }
      });
      Item fetchedItem =
          Item(itemName: itemName, itemPrice: itemPrice, itemId: itemId);

      setState(() {
        itemsList.add(fetchedItem);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ItemsList(items: itemsList),
            ]),
      ),
    );
  }
}
