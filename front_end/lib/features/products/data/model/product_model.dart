
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.brand,
    required super.images,
  });

  

  factory ProductModel.fromJson(DataMap map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      brand: map['brand'] ?? "",
      images: map['images']??[],
 
    );
  }





  

 


ProductModel  copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    String? brand,
    List<String>?images,
   
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      brand: brand ?? this.brand ,
      images:images??this.images,
      
    );
  }

  
}
