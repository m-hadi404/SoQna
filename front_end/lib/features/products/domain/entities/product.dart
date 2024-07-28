import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
  
  });

  final int id;
  final String title;
  final String description;
  final int price;
  final String brand;
 

  @override
  List<Object> get props {
    return [
      id,
     title,
     description,
     price,
     brand
    ];
  }
}
