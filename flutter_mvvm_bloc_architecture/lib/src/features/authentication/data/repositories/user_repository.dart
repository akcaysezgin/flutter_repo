import '../../../../core/network/api_result.dart';
import '../../../../core/repository/repository_helper.dart';
import '../../domain/entities/user_entity.dart';
import '../datasources/user_datasources.dart';
import '../models/user.dart';

class UserRepository with RepositoryHelper<UserModel> {
  final UserApi userApi;

  const UserRepository({required this.userApi});

  Future<ApiResult<List<UserModel>>> getUsers(
      {Gender? gender, UserStatus? status}) async {
    return checkItemsFailOrSuccess(
        userApi.getUsers(gender: gender, status: status));
  }

  Future<ApiResult<bool>> createUser(UserModel user) async {
    return checkItemFailOrSuccess(userApi.createUser(user));
  }

  Future<ApiResult<bool>> updateUser(UserModel user) async {
    return checkItemFailOrSuccess(userApi.updateUser(user));
  }

  Future<ApiResult<bool>> deleteUser(UserModel user) async {
    return checkItemFailOrSuccess(userApi.deleteUser(user));
  }
}
