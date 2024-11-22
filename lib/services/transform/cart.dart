import 'package:f_shop_1/models/cart_item.dart';
import 'package:f_shop_1/typedefs/cart.dart';

class CartTransformer {
  // static CartItemMap listToMap(List<CartItem> cartItemList) {
  //   // final CartItemsMap itemsMap = {
  //   //   for (final item in cartItemList) item.colorItem.id: item,
  //   // };
  //   // return cartItemList.fold<CartItemMap>({}, (prev, curr) {
  //   //   prev[curr.colorItem.id] = curr;
  //   //   return prev;
  //   // });
  //   return Map.fromIterable(cartItemList,
  //       key: (item) => (item as CartItem).colorItem.id);
  // }

  static CartItemMap jsonToMap(Map<String, dynamic> json) {
    // final Map<String, CartItem> parsedItems = {};
    // json.forEach((key, value) {
    //   parsedItems[key] = CartItem.fromJson(value as Map<String, dynamic>);
    // });
    // return parsedItems;
    return {
      for (final entry in json.entries)
        entry.key: CartItem.fromJson(entry.value as Map<String, dynamic>),
    };
  }

  static Map<String, dynamic> mapToJson(CartItemMap cartItemMap) {
    final Map<String, dynamic> json = {};
    cartItemMap.forEach((key, value) {
      json[key] = value.toJson();
    });
    return json;
    // return {
    //   for (final entry in cartItemMap.entries)
    //     entry.key: entry.value.toJson(),
    // };
  }
}
