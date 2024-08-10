import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
  const CartItem({
    required this.id,
    required this.title,
    required this.discountedTotal,
    required this.totalQuantity,
    required this.image,
  });

  final int id;
  final String title;
  final double discountedTotal;
  final int totalQuantity;
  final String image;


  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      discountedTotal: json['discountedTotal'],
      totalQuantity: json['totalQuantity'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'discountedTotal': discountedTotal,
      'totalQuantity': totalQuantity,
      'image': image,
    };
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      discountedTotal,
      totalQuantity,
      image,
    ];
  }
}
