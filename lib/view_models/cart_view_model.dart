import 'package:f_shop_1/models/cart_item.dart';
import 'package:f_shop_1/services/api/cart.dart';
import 'package:f_shop_1/typedefs/cart.dart';
import 'package:flutter/foundation.dart';

// Dart's Map keeps order of first -> last added item
class CartViewModel extends ChangeNotifier {
  final CartApi _apiService;
  CartItemMap _cartItems = {};
  bool _isLoading = false;

  CartItemMap get cartItems => _cartItems;
  int get totalItems =>
      cartItems.values.fold(0, (prev, item) => prev + item.quantity);
  bool get isLoading => _isLoading;

  bool _disposed = false;
  bool get disposed => _disposed;

  CartViewModel({required CartApi apiService}) : _apiService = apiService {
    _fetchCart();
  }

  @override
  void notifyListeners() {
    if (!disposed) super.notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> _fetchCart() async {
    _isLoading = true;
    notifyListeners();

    try {
      _cartItems = await _apiService.fetchCart();
    } catch (e) {
      debugPrint('Error fetching banners: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _updateCart(
      CartItemMap Function(CartItemMap) updateCallback) async {
    _isLoading = true;
    notifyListeners();

    try {
      final CartItemMap tempCart = updateCallback(Map.from(_cartItems));
      if (await _apiService.updateCart(tempCart)) {
        _cartItems = tempCart;
      } else {
        throw 'Repository updateCart failed';
      }
    } catch (e) {
      debugPrint('Error updating cart: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // need id only
  Future<void> add(ColorItem colorItem) async {
    await _updateCart((cartItems) {
      return cartItems
        ..update(colorItem.id,
            (existed) => existed.copyWith(quantity: existed.quantity + 1),
            ifAbsent: () => CartItem(colorItem: colorItem, quantity: 1));
    });
  }

  Future<void> removeOne(String id) async {
    await _updateCart((cartItems) {
      if ((_cartItems[id]?.quantity ?? 1) == 1) return cartItems..remove(id);

      return cartItems
        ..update(
            id, (existed) => existed.copyWith(quantity: existed.quantity - 1));
    });
  }

  Future<void> removeAll(String id) async {
    await _updateCart((cartItems) {
      return cartItems..remove(id);
    });
  }

  Future<void> clear() async {
    _isLoading = true;
    notifyListeners();

    try {
      if (await _apiService.clearCart()) {
        _cartItems.clear();
      } else {
        throw 'Repository clearCart failed';
      }
    } catch (e) {
      debugPrint('Error clear item: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
