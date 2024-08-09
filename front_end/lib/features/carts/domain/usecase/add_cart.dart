
import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/domain/repository/base_cart_repository.dart';

class AddCartsUseCase extends BaseUseCase<void, AddCartParameters> {
  AddCartsUseCase(this.cartRepository);

  final BaseCartRepository cartRepository;

  @override
  ResultVoid call(AddCartParameters parameters) async {
    return await cartRepository.addCart(userId: parameters.userId,products: parameters.products);
  }
  
}


class AddCartParameters extends Equatable{
  final int userId;
  final List<AddCartModel> products;
  const AddCartParameters({
    required this.userId,
    required this.products
  });
  
  
  @override
  List<Object?> get props => [userId, products];
  
}