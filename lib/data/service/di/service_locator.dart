import 'package:get_it/get_it.dart';
import 'package:thekettu/data/repository/auth_repository_impl.dart';
import 'package:thekettu/data/service/source/local/secure_storage.dart';
import 'package:thekettu/domain/repository/auth_repository.dart';
import 'package:thekettu/domain/usecase/auth/login_usecase.dart';
import 'package:thekettu/presentation/pages/auth/bloc/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> setUp() async {
  sl.registerLazySingleton<SecureStorage>(() => SecureStorage());
  //repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(secureStorage: sl<SecureStorage>()));
  //usecase
  sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(authRepository: sl<AuthRepository>()));
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(authRepository: sl<AuthRepository>(), loginUseCase: sl<LoginUseCase>()));
}
