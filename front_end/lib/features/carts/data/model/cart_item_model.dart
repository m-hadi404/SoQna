import 'dart:convert';

import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/domain/entities/cart_item.dart';

class CartItemModel extends CartItem {
  const CartItemModel({
    required super.id,
    required super.title,
    required super.discountedTotal,
    required super.totalQuantity,
    required super.image,
  });

  factory CartItemModel.fromJson(DataMap map) {
    return CartItemModel(
      id: map['id'] as int,
      title: map['title'] as String,
      discountedTotal: map['total'] as double,
      totalQuantity: map['quantity'] as int,
      image: map['thumbnail'] as String,
    );
  }


  @override
  bool get stringify => true;

  CartItemModel copyWith({
    int? id,
    String? title,
    double? discountedTotal,
    int? totalQuantity,
    String? image,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      discountedTotal: discountedTotal ?? this.discountedTotal,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      image: image ?? this.image,
    );
  }
}
