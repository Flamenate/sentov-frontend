import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sento_staff/models/item.dart';
import 'package:sento_staff/services/item_service.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu({super.key});

  @override
  State<ItemMenu> createState() => ItemMenuState();
}

class ItemMenuState extends State<ItemMenu> {
  int selectedItemId = -1;
  List<Item> items = [Item.placeholder()];

  @override
  void initState() {
    super.initState();
    ItemService().getAll().then(
      (retrievedItems) {
        setState(() {
          items.addAll(retrievedItems);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white54),
      child: DropdownButton<int>(
        elevation: 15,
        value: selectedItemId,
        dropdownColor: Color.fromARGB(255, 233, 233, 233),
        borderRadius: BorderRadius.circular(20.0),
        iconSize: 25.0,
        underline: SizedBox(),
        isExpanded: true,
        items: items
            .map(((item) => DropdownMenuItem(
                value: item.id,
                child: Text(item.id != -1
                    ? "${item.name} — 金 ${NumberFormat.currency(symbol: '', decimalDigits: 0).format(item.price)} — ${item.quantity}x"
                    : item.name))))
            .toList(),
        onChanged: (int? value) {
          setState(() {
            selectedItemId = value!;
          });
        },
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );
  }
}
