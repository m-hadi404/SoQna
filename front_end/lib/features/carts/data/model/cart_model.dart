import 'dart:convert';

import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required super.id,
    required super.title,
    required super.discountedTotal,
    required super.totalQuantity,
    required super.image,
  });

  factory CartModel.fromJson(DataMap map) {
    return CartModel(
      id: map['id'] as String,
      title: map['title'] as String,
      discountedTotal: map['total'] as int,
      totalQuantity: map['quantity'] as int,
      image: map['thumbnail'] as String,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'discountedTotal': discountedTotal,
      'totalQuantity': totalQuantity,
      'image': image,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  CartModel copyWith({
    String? id,
    String? title,
    int? discountedTotal,
    int? totalQuantity,
    String? image,
  }) {
    return CartModel(
      id: id ?? this.id,
      title: title ?? this.title,
      discountedTotal: discountedTotal ?? this.discountedTotal,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      image: image ?? this.image,
    );
  }
}
