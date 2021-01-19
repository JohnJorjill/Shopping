import 'package:flutter/material.dart';
import 'package:shop_cart_app/item_tile.dart';

import 'models/item.dart';

class ItemsList extends StatelessWidget {
  ItemsList({this.items});
  List<Item> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemTile(
          itemName: item.itemName,
          itemPrice: item.itemPrice,
          itemId: item.itemId,
        );
      },
      itemCount: items.length,
    );
  }
}
