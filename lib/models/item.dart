class Item {
  final int id;
  final String name;
  final int price;
  final int quantity;

  const Item(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"]);
  }

  factory Item.placeholder() {
    return Item(id: -1, name: "Pick an item...", price: -1, quantity: -1);
  }
}
