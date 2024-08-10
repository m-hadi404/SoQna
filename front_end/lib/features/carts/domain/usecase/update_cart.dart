import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/data/model/addCart_model.dart';
import 'package:front_end/features/carts/domain/repository/base_cart_repository.dart';

class UpdateCartsUseCase extends BaseUseCase<void, UpdateCartParameters> {
  UpdateCartsUseCase(this.cartRepository);

  final BaseCartRepository cartRepository;

  @override
  ResultVoid call(UpdateCartParameters parameters) async {
    return await cartRepository.updateCart(
        id: parameters.id, products: parameters.products);
  }
}

class UpdateCartParameters extends Equatable {
  final int id;
  final List<AddCartModel> products;
  const UpdateCartParameters({required this.id, required this.products});

  @override
  List<Object?> get props => [id, products];
}
