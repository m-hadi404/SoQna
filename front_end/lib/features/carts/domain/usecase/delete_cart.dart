import 'package:equatable/equatable.dart';
import 'package:front_end/core/usecase/base_usecase.dart';
import 'package:front_end/core/utils/typedef.dart';
import 'package:front_end/features/carts/domain/repository/base_cart_repository.dart';

class DeleteCartsUseCase extends BaseUseCase<void, DeleteCartParameters> {
  DeleteCartsUseCase(this.cartRepository);

  final BaseCartRepository cartRepository;

  @override
  ResultVoid call(DeleteCartParameters parameters) async {
    return await cartRepository.deleteCart(parameters.id);
  }
  
}

class DeleteCartParameters extends Equatable{
  final int id;
  const DeleteCartParameters({required this.id});
  
  @override
  List<Object?> get props => [id];
}