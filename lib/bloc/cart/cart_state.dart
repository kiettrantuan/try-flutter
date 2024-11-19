part of 'cart_bloc.dart';

final class CartState extends Equatable {
  final Map<String, CartItem> _items;

  const CartState({required Map<String, CartItem> items}) : _items = items;

  Map<String, CartItem> get items => Map.unmodifiable(_items);

  @override
  List<Object> get props => [_items];
}
