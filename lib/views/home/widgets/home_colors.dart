import 'package:f_shop_1/models/cart_item.dart';
import 'package:f_shop_1/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeColors extends StatefulWidget {
  const HomeColors({super.key});

  @override
  State<HomeColors> createState() => _HomeColorsState();
}

class _HomeColorsState extends State<HomeColors> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Consumer<CartViewModel>(
        builder: (_, cart, __) => Column(
          children: [
            ...ListTile.divideTiles(
                context: context,
                tiles: colorList.map((colorItem) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                    leading: ColoredBox(
                        color: colorItem.color,
                        child: const SizedBox.square(
                          dimension: 40,
                        )),
                    title: Text(colorItem.title),
                    trailing: TextButton.icon(
                      onPressed: () {
                        cart.add(colorItem);
                      },
                      label: Text(
                          '${cart.cartItems[colorItem.id]?.quantity ?? 'ADD'}'),
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(Icons.add),
                    ),
                  );
                }))
          ],
        ),
      ),
    );
  }
}

final List<ColorItem> colorList = [
  ColorItem(id: "clr_black_001", title: "Black", color: Colors.black),
  ColorItem(id: "clr_grey_002", title: "Grey", color: Colors.grey),
  ColorItem(id: "clr_red_003", title: "Red", color: Colors.red),
  ColorItem(id: "clr_green_004", title: "Green", color: Colors.green),
  ColorItem(id: "clr_blue_005", title: "Blue", color: Colors.blue),
  ColorItem(id: "clr_yellow_006", title: "Yellow", color: Colors.yellow),
  ColorItem(id: "clr_orange_007", title: "Orange", color: Colors.orange),
  ColorItem(id: "clr_purple_008", title: "Purple", color: Colors.purple),
  ColorItem(id: "clr_pink_009", title: "Pink", color: Colors.pink),
  ColorItem(id: "clr_brown_010", title: "Brown", color: Colors.brown),
];
