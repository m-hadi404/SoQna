import 'dart:convert';

import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/domain/entities/addCartEntite.dart';


class AddCartModel extends Addcartentite {
  AddCartModel({
    required super.id_product,
    required super.quantity,
  });

  factory AddCartModel.fromJson(DataMap map) {
    return AddCartModel(
      id_product: map['id_product'] as int,
      quantity: map['quantity'] as int,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'id': id_product,
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
      id_product: id ?? id_product,
      quantity: quantity ?? this.quantity,
    );
  }
}
