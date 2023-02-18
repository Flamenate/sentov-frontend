class Item {
  final int id;
  final String name;
  final int price;
  final int category;

  const Item({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        category: json["category"]);
  }

  factory Item.placeholder() {
    return Item(id: -1, name: "Pick an item...", price: -1, category: -1);
  }
}
