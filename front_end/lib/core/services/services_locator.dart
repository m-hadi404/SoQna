import 'package:front_end/features/auth/domain/usecase/get_users.dart';
import 'package:front_end/features/carts/data/data_source/cart_remote_data_source.dart';
import 'package:front_end/features/carts/data/repository/cart_repository.dart';
import 'package:front_end/features/carts/domain/repository/base_cart_repository.dart';
import 'package:front_end/features/carts/domain/usecase/add_cart.dart';
import 'package:front_end/features/carts/domain/usecase/delete_cart.dart';
import 'package:front_end/features/carts/domain/usecase/get_carts.dart';
import 'package:front_end/features/carts/domain/usecase/update_cart.dart';
import 'package:front_end/features/carts/presentation/controller/cart_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:front_end/features/auth/data/data_source/user_remote_data_source.dart';
import 'package:front_end/features/auth/data/repository/auth_repository.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';
import 'package:front_end/features/auth/domain/usecase/create_user.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerLazySingleton(() => AuthBloc(sl(), sl()));
    sl.registerLazySingleton(()=> CartBloc(sl(), sl(), sl(), sl()));
    /// USE CACES
    sl.registerLazySingleton(() => CreateUserUseCase(sl()));
    sl.registerLazySingleton(() => GetUsersUseCase(sl()));
    sl.registerLazySingleton(() => GetCartsUseCase(sl()));
    sl.registerLazySingleton(() => AddCartsUseCase(sl()));
    sl.registerLazySingleton(() => DeleteCartsUseCase(sl()));
    sl.registerLazySingleton(() => UpdateCartsUseCase(sl()));
    /// REPOSESITORY
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(sl()));
    sl.registerLazySingleton<BaseCartRepository>(()=>CartRepository(sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());
    sl.registerLazySingleton<BaseCartRemoteDataSource>(()=>CartRemoteDataSource());
  }
}
