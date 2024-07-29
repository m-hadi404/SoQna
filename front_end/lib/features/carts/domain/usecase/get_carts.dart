import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/domain/entities/cart.dart';
import 'package:front_end/features/carts/domain/repository/base_cart_repository.dart';

class GetCartsUseCase extends BaseUseCase<List<Cart>, GetCartParameters> {
  GetCartsUseCase(this.cartRepository);

  final BaseCartRepository cartRepository;

  @override
  ResultFuture<List<Cart>> call(GetCartParameters parameters) async {
    return await cartRepository.getCart(parameters.id);
  }
  
}
class GetCartParameters extends Equatable{
  final int id;
  const GetCartParameters({required this.id});
  
  @override
  List<Object?> get props => [id];
}