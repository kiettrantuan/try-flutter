import 'package:f_shop_1/models/cart_item.dart';
import 'package:f_shop_1/widgets/color_tile.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;
  final VoidCallback onAdd;
  final VoidCallback onRemoveAll;

  const CartTile({
    super.key,
    required this.cartItem,
    required this.onRemove,
    required this.onAdd,
    required this.onRemoveAll,
  });

  @override
  Widget build(BuildContext context) {
    return ColorTile(
      colorItem: cartItem.colorItem,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.remove), onPressed: onRemove),
          IconButton(icon: const Icon(Icons.add), onPressed: onAdd),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 20),
            child: Center(child: Text('${cartItem.quantity}')),
          ),
          IconButton(icon: const Icon(Icons.clear), onPressed: onRemoveAll),
        ],
      ),
    );
  }
}
