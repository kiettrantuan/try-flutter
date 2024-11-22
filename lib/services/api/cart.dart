import 'dart:convert';

import 'package:f_shop_1/services/shared_preferences.dart';
import 'package:f_shop_1/services/transform/cart.dart';
import 'package:f_shop_1/typedefs/cart.dart';

// use local store for example

class CartApi {
  Future<CartItemMap> fetchCart() async {
    var rawCartItems = await SharedPreferencesService.getString(
        SharedPreferencesKeys.cartItems);

    return rawCartItems != null
        ? CartTransformer.jsonToMap(jsonDecode(
            rawCartItems,
          ))
        : {};
  }

  Future<bool> updateCart(CartItemMap cart) {
    final cartJson = jsonEncode(CartTransformer.mapToJson(cart));
    return SharedPreferencesService.setString(
        SharedPreferencesKeys.cartItems, cartJson);
  }

  Future<bool> clearCart() {
    return SharedPreferencesService.remove(SharedPreferencesKeys.cartItems);
  }
}
