import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  const Cart({
    required this.id,
    required this.title,
    required this.discountedTotal,
    required this.totalQuantity,
    required this.image,
  });

  final String id;
  final String title;
  final int discountedTotal;
  final int totalQuantity;
  final String image;

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
