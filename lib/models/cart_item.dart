import 'dart:ui';

class ColorItem {
  final String id;
  final String title;
  final Color color;

  const ColorItem({required this.id, required this.title, required this.color});

  factory ColorItem.fromJson(Map<String, dynamic> json) {
    return ColorItem(
      id: json['id'] as String,
      title: json['title'] as String,
      color: Color(json['color'] as int),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'color': color.value,
      };
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

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      colorItem: ColorItem.fromJson(json['colorItem']),
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
        'colorItem': colorItem.toJson(),
        'quantity': quantity,
      };
}
