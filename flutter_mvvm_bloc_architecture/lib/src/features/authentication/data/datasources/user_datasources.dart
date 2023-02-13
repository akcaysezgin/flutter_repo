import 'dart:convert';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../constants/api_config.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user.dart';

class UserApi with ApiHelper<UserModel> {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<bool> createUser(UserModel user) async {
    return await makePostRequest(
        dioClient.dio.post(ApiConfig.users, data: user));
  }

  Future<bool> updateUser(UserModel user) async {
    return await makePutRequest(
        dioClient.dio.put("${ApiConfig.users}/${user.id}", data: user));
  }

  Future<bool> deleteUser(UserModel user) async {
    return await makeDeleteRequest(
        dioClient.dio.delete("${ApiConfig.users}/${user.id}"));
  }

  Future<List<UserModel>> getUsers({Gender? gender, UserStatus? status}) async {
    Map<String, String> queryParameters = <String, String>{};

    if (gender != null && gender != Gender.all) {
      queryParameters.addAll({'gender': gender.name});
    }

    if (status != null && status != UserStatus.all) {
      queryParameters.addAll({'status': status.name});
    }

    return await makeGetRequest(
        dioClient.dio.get(ApiConfig.users, queryParameters: queryParameters),
        UserModel.fromMap);
  }
}
