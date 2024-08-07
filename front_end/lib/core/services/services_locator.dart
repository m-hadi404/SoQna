import 'package:front_end/features/auth/data/data_source/user_local_data_source.dart';
import 'package:front_end/features/auth/domain/usecase/get_user.dart';
import 'package:front_end/features/auth/domain/usecase/is_authorized.dart';
import 'package:front_end/features/auth/domain/usecase/logout.dart';
import 'package:front_end/features/auth/domain/usecase/sing_up.dart';
import 'package:front_end/features/auth/domain/usecase/update_user.dart';
import 'package:get_it/get_it.dart';
import 'package:front_end/features/auth/data/data_source/user_remote_data_source.dart';
import 'package:front_end/features/auth/data/repository/auth_repository.dart';
import 'package:front_end/features/auth/domain/repository/base_auth_repository.dart';
import 'package:front_end/features/auth/domain/usecase/sing_in.dart';
import 'package:front_end/features/auth/presentation/controller/auth_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerLazySingleton(() => AuthBloc(sl(), sl(),sl(),sl(),sl(),sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetUserUseCase(sl()));
    sl.registerLazySingleton(() => SignInUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton(() => UpdateUserUseCase(sl()));
    sl.registerLazySingleton(() => IsAuthorizedUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(sl(),sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseUserLocalDataSource>(
        () => UserLocalDataSource(baseUserRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());
  }
}
