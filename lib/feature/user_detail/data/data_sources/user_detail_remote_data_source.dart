import 'dart:convert';
import 'package:clean_code_practice/core/error/exceptions.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserDetailRemoteDataSource {
  Future<UserDetailModel> getUserInfo({required int id});
}

class UserDetailRemoteDataSourceImp implements UserDetailRemoteDataSource {
  final http.Client client;
  UserDetailRemoteDataSourceImp({required this.client});

  @override
  Future<UserDetailModel> getUserInfo({required int id}) async {
    final response = await client.get(Uri.parse(
      ("https://reqres.in/api/users/$id"),
    ));

    if (response.statusCode == 200) {
      return UserDetailModel.fromJson(json.decode(response.body)["data"]);
    } else {
      throw ServerException("There is some  problem in connectivity");
    }
  }
}
