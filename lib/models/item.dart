class Item {
  final String itemName;
  final int itemPrice;
  final int itemId;

  Item({this.itemName, this.itemPrice, this.itemId});

  void getName() {
    print(itemName);
  }
}
