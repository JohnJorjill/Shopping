import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final int itemId;

  ItemTile({this.itemName, this.itemPrice, this.itemId});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        itemName,
      ),
      trailing: Text(
        itemPrice.toString(),
      ),
    );
  }
}
