import 'package:mvvm_bloc/data/repository/user/user_repository.dart';
import 'package:mvvm_bloc/presentation/viewmodel/user/bloc/user_bloc.dart';
import 'package:mvvm_bloc/application/services/network/dio_client.dart';
import 'package:mvvm_bloc/data/api/user/user_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

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
