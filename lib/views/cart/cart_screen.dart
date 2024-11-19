import 'package:f_shop_1/view_models/cart_view_model.dart';
import 'package:f_shop_1/widgets/color_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          var total = cart.cartItems.values
              .fold(0, (prev, item) => prev + item.quantity);

          List<ColorTile> tiles = [];
          for (var entry in cart.cartItems.entries) {
            final id = entry.key;
            final cartItem = entry.value;
            if (kDebugMode) {
              print(id);
            }

            tiles.insert(
                0,
                ColorTile(
                  colorItem: cartItem.colorItem,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          cart.removeOne(id);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          cart.add(cartItem.colorItem);
                        },
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 20),
                        child: Center(child: Text('${cartItem.quantity}')),
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          cart.removeAll(id);
                        },
                      ),
                    ],
                  ),
                ));
          }

          return Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    ...ListTile.divideTiles(context: context, tiles: tiles)
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
                        Text('$total'),
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
