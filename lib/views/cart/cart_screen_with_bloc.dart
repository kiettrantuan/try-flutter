import 'package:f_shop_1/bloc/cart/cart_bloc.dart';
import 'package:f_shop_1/widgets/color_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenWithBloc extends StatefulWidget {
  const CartScreenWithBloc({super.key});

  @override
  State<CartScreenWithBloc> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreenWithBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(builder: (ctx, state) {
          var total =
              state.items.values.fold(0, (prev, item) => prev + item.quantity);

          List<ColorTile> tiles = [];
          for (var entry in state.items.entries) {
            final id = entry.key;
            final item = entry.value;

            tiles.insert(
                0,
                ColorTile(
                  colorItem: item.colorItem,
                  trailing: QuantityControl(
                    onDecrement: () => ctx.read<CartBloc>().add(RemoveOne(id)),
                    onIncrement: () =>
                        ctx.read<CartBloc>().add(AddItem(item: item.colorItem)),
                    onClear: () => ctx.read<CartBloc>().add(RemoveAll(id)),
                    quantity: item.quantity,
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
                child: CartSummary(
                    totalQuantity: total,
                    onClear: () => ctx.read<CartBloc>().add(const ClearCart())),
              )
            ],
          );
        }),
      ),
    );
  }
}

class QuantityControl extends StatelessWidget {
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;
  final VoidCallback onClear;
  final int quantity;

  const QuantityControl({
    required this.onDecrement,
    required this.onIncrement,
    required this.onClear,
    required this.quantity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: const Icon(Icons.remove), onPressed: onDecrement),
        IconButton(icon: const Icon(Icons.add), onPressed: onIncrement),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 20),
          child: Center(child: Text('$quantity')),
        ),
        IconButton(icon: const Icon(Icons.clear), onPressed: onClear),
      ],
    );
  }
}

class CartSummary extends StatelessWidget {
  final int totalQuantity;
  final VoidCallback onClear;

  const CartSummary({
    required this.totalQuantity,
    required this.onClear,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            const SizedBox(height: 64),
            const Text('Total'),
            Text('$totalQuantity'),
          ],
        ),
        TableRow(
          children: <Widget>[
            const SizedBox(height: 64),
            Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: onClear,
                child: const Text('Clear'),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ],
    );
  }
}
