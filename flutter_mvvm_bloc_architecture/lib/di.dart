import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_bloc/src/features/authentication/data/datasources/user_datasources.dart';

import 'src/core/network/dio_client.dart';
import 'src/features/authentication/data/repositories/user_repository.dart';
import 'src/features/authentication/presentation/viewmodel/bloc/user_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  // User api
  getIt.registerLazySingleton<UserApi>(
      () => UserApi(dioClient: getIt<DioClient>()));

  // User repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(userApi: getIt<UserApi>()),
  );

  //User Bloc
  getIt
      .registerFactory(() => UserBloc(userRepository: getIt<UserRepository>()));
}
