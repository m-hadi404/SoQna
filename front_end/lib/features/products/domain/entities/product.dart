import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.images
  });

  final int id;
  final String title;
  final String description;
  final double price;
  final String brand;
  final List<dynamic> images;

  @override
  List<Object> get props {
    return [id, title, description, price, brand,images];
  }
}
