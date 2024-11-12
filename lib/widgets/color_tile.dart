import 'package:f_shop_1/models/cart_item.dart';
import 'package:flutter/material.dart';

class ColorTile extends StatelessWidget {
  final ColorItem colorItem;
  final Widget? trailing;

  const ColorTile({super.key, required this.colorItem, this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
      leading: ColoredBox(
          color: colorItem.color,
          child: const SizedBox.square(
            dimension: 40,
          )),
      title: Text(colorItem.title),
      trailing: trailing,
    );
  }
}
