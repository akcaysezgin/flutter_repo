import 'package:mvvm_bloc/application/core/api_config.dart';

import '../../../application/services/network/api_helper.dart';
import '../../../application/services/network/dio_client.dart';
import '../../../domain/user/user.dart';

class UserApi with ApiHelper<User> {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<bool> createUser(User user) async {
    return await makePostRequest(
        dioClient.dio.post(ApiConfig.users, data: user));
  }

  Future<bool> updateUser(User user) async {
    return await makePutRequest(
        dioClient.dio.put("${ApiConfig.users}/${user.id}", data: user));
  }

  Future<bool> deleteUser(User user) async {
    return await makeDeleteRequest(
        dioClient.dio.delete("${ApiConfig.users}/${user.id}"));
  }

  Future<List<User>> getUsers({Gender? gender, UserStatus? status}) async {
    Map<String, String> queryParameters = <String, String>{};

    if (gender != null && gender != Gender.all) {
      queryParameters.addAll({'gender': gender.name});
    }

    if (status != null && status != UserStatus.all) {
      queryParameters.addAll({'status': status.name});
    }

    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.users, queryParameters: queryParameters),
        User.fromMap);
  }
}
