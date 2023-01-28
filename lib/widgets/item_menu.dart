import 'package:flutter/material.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu({super.key});

  @override
  State<ItemMenu> createState() => ItemMenuState();
}

class ItemMenuState extends State<ItemMenu> {
  int selectedItemId = -1;

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
        items: _buildItemList(),
        onChanged: (int? value) {
          setState(() {
            selectedItemId = value!;
          });
        },
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
    );
  }

  List<DropdownMenuItem<int>> _buildItemList() {
    return [
      DropdownMenuItem(value: -1, child: Text("Pick an item...")),
      DropdownMenuItem(value: 0, child: Text("poster angela white")),
      DropdownMenuItem(value: 1, child: Text("nami (mouch mta3 one piece)")),
      DropdownMenuItem(value: 2, child: Text("iniesta")),
      DropdownMenuItem(value: 3, child: Text("maryoul andrew tate")),
      DropdownMenuItem(value: 4, child: Text("casquette lefri9i"))
    ];
  }
}
