import 'package:f_shop_1/view_models/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SafeArea(
        child: Consumer<CartViewModel>(builder: (_, cart, __) {
          List<CartTile> cartTiles = [];
          for (var entry in cart.cartItems.entries) {
            final id = entry.key;
            final cartItem = entry.value;

            cartTiles.insert(
                0,
                CartTile(
                    cartItem: cartItem,
                    onRemove: () => cart.removeOne(id),
                    onAdd: () => cart.add(cartItem.colorItem),
                    onRemoveAll: () => cart.removeAll(id)));
          }

          return Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ...ListTile.divideTiles(context: context, tiles: cartTiles)
                  ],
                ),
              )),
              const Divider(height: 1),
              SizedBox(
                height: 200,
                child: Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(64),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        const SizedBox(
                          height: 64,
                        ),
                        const Text('Total'),
                        Text('${cart.totalItems}'),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        const SizedBox(
                          height: 64,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: OutlinedButton(
                              onPressed: () {
                                cart.clear();
                              },
                              child: const Text('Clear')),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
