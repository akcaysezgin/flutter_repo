import 'package:mvvm_bloc/application/services/repository/repository_helper.dart';
import 'package:mvvm_bloc/application/services/network/api_result.dart';
import 'package:mvvm_bloc/data/api/user/user_api.dart';
import 'package:mvvm_bloc/domain/user/user.dart';

class UserRepository with RepositoryHelper<User> {
  final UserApi userApi;

  const UserRepository({required this.userApi});

  Future<ApiResult<List<User>>> getUsers(
      {Gender? gender, UserStatus? status}) async {
    return checkItemsFailOrSuccess(
        userApi.getUsers(gender: gender, status: status));
  }

  Future<ApiResult<bool>> createUser(User user) async {
    return checkItemFailOrSuccess(userApi.createUser(user));
  }

  Future<ApiResult<bool>> updateUser(User user) async {
    return checkItemFailOrSuccess(userApi.updateUser(user));
  }

  Future<ApiResult<bool>> deleteUser(User user) async {
    return checkItemFailOrSuccess(userApi.deleteUser(user));
  }
}
