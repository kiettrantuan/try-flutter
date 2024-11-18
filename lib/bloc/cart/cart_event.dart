part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {
  const CartEvent();
}

final class AddItem extends CartEvent {
  // cartItem instead of colorItem
  final ColorItem item;
  const AddItem({required this.item});
}

final class RemoveOne extends CartEvent {
  final String id;
  const RemoveOne(this.id);
}

final class RemoveAll extends CartEvent {
  final String id;
  const RemoveAll(this.id);
}

final class ClearCart extends CartEvent {
  const ClearCart();
}
