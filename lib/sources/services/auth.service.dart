import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_config/flutter_config.dart';

class AuthService {
  final path = FlutterConfig.get('API_PATH');
  final dio = Dio();

  // SignIn
  Future signIn(role, email, password) async {
    var url = '$path/UM/login';
    final response = await dio.get(url, queryParameters: {
      'status': role,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var status = json.decode(response.data)['status'];
      var message = json.decode(response.data)['message'];
      var body = json.decode(response.data)['body'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }

  // SignUp Admin
  Future signUpAdmin(
      name, email, password, buildingName, address, biography) async {
    var url = '$path/UM/sign-up-admin-bd';
    final response = await dio.post(url, data: {
      'name': name,
      'email': email,
      'password': password,
      'BuildingName': buildingName,
      'Address': address,
      'Biography': biography,
    });
    if (response.statusCode == 200) {
      var status = json.decode(response.data)['status'];
      var message = json.decode(response.data)['message'];
      var body = json.decode(response.data)['body'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }

  // SignUp Postman
  Future signUpPostman(name, email, password) async {
    var url = '$path/UM/sign-up-postman';
    final response = await dio.post(url, data: {
      'name': name,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var status = json.decode(response.data)['status'];
      var message = json.decode(response.data)['message'];
      var body = json.decode(response.data)['body'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }
}
