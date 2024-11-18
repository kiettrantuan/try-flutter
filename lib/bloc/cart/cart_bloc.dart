import 'package:equatable/equatable.dart';
import 'package:f_shop_1/models/cart_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(items: {})) {
    on<AddItem>(_onAddItem);
    on<RemoveOne>(_onRemoveOne);
    on<RemoveAll>(_onRemoveAll);
    on<ClearCart>(_onClearCart);
  }

  void _onAddItem(AddItem event, Emitter<CartState> emit) {
    try {
      final updatedItems = Map<String, CartItem>.from(state.items);
      updatedItems.update(
        event.item.id,
        (existing) => existing.copyWith(quantity: existing.quantity + 1),
        ifAbsent: () => CartItem(colorItem: event.item, quantity: 1),
      );
      emit(CartState(items: updatedItems));
    } catch (e) {
      debugPrint('Error adding item: $e');
    }
  }

  void _onRemoveOne(RemoveOne event, Emitter<CartState> emit) {
    try {
      final updatedItems = Map<String, CartItem>.from(state.items);
      final currentItem = updatedItems[event.id];

      if (currentItem == null) return;

      if (currentItem.quantity == 1) {
        updatedItems.remove(event.id);
      } else {
        updatedItems[event.id] =
            currentItem.copyWith(quantity: currentItem.quantity - 1);
      }
      emit(CartState(items: updatedItems));
    } catch (e) {
      debugPrint('Error removing one item: $e');
    }
  }

  void _onRemoveAll(RemoveAll event, Emitter<CartState> emit) {
    try {
      final updatedItems = Map<String, CartItem>.from(state.items)
        ..remove(event.id);
      emit(CartState(items: updatedItems));
    } catch (e) {
      debugPrint('Error removing all items: $e');
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    try {
      emit(const CartState(items: {}));
    } catch (e) {
      debugPrint('Error clear cart: $e');
    }
  }
}
