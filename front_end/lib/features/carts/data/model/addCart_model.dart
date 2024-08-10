// ignore_for_file: file_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:front_end/core/utils/typedef.dart';

class AddCartModel extends Equatable{
  const AddCartModel({required this.productId, required this.quantity});
  final int productId;
  final int quantity;
  factory AddCartModel.fromJson(DataMap map) {
    return AddCartModel(
      productId: map['productId'] as int,
      quantity: map['quantity'] as int,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'id': productId,
      'quantity': quantity,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  AddCartModel copyWith({
    int? id,
    int? quantity,
  }) {
    return AddCartModel(
      productId: id ?? productId,
      quantity: quantity ?? this.quantity,
    );
  }
  
  @override

  List<Object?> get props => [productId, quantity];
}
