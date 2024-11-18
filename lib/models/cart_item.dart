import 'package:flutter/material.dart';

class ColorItem {
  final String id;
  final String title;
  final Color color;

  ColorItem({required this.id, required this.title, required this.color});
}

class CartItem {
  final ColorItem colorItem;
  int quantity;

  CartItem({required this.colorItem, required this.quantity});

  CartItem copyWith({ColorItem? colorItem, int? quantity}) {
    return CartItem(
      colorItem: colorItem ?? this.colorItem,
      quantity: quantity ?? this.quantity,
    );
  }
}
