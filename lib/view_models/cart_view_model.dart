import 'package:f_shop_1/models/cart_item.dart';
import 'package:flutter/foundation.dart';

class CartViewModel extends ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};
  bool _isLoading = false;

  Map<String, CartItem> get cartItems => _cartItems;
  bool get isLoading => _isLoading;

  bool _disposed = false;
  bool get disposed => _disposed;

  @override
  void notifyListeners() {
    if (!disposed) super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  // need id only
  Future<void> add(ColorItem colorItem) async {
    _isLoading = true;
    notifyListeners();

    try {
      _cartItems.update(
          colorItem.id,
          (existed) =>
              CartItem(colorItem: colorItem, quantity: existed.quantity + 1),
          ifAbsent: () => CartItem(colorItem: colorItem, quantity: 1));
    } catch (e) {
      if (kDebugMode) {
        print('Error add item: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }

    _cartItems.forEach((key, value) {
      if (kDebugMode) {
        print('$key: ${value.quantity}');
      }
    });
  }

  Future<void> removeOne(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      if ((_cartItems[id]?.quantity ?? 1) == 1) {
        _cartItems.remove(id);
      } else {
        _cartItems.update(
          id,
          (existed) => CartItem(
              colorItem: existed.colorItem, quantity: existed.quantity - 1),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error removeOne item: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> removeAll(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _cartItems.remove(id);
    } catch (e) {
      if (kDebugMode) {
        print('Error removeAll item: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> clear() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cartItems.clear();
    } catch (e) {
      if (kDebugMode) {
        print('Error clear item: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
