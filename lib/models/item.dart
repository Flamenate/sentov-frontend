enum Category { clothes, accessories, posters }

class Item {
  final int id;
  final String name;
  final int price;
  final Category category;

  const Item({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });
}
