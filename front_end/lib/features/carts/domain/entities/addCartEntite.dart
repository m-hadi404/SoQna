import 'package:equatable/equatable.dart';

class Addcartentite extends Equatable{
  final int id_product;
  final int quantity;
  Addcartentite({required int this.id_product, this.quantity = 1});
  
  @override
  // TODO: implement props
  List<Object?> get props => [id_product, quantity];


}