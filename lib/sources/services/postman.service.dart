import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

class PostmanService {
  final path = FlutterConfig.get('API_PATH');

  // SignIn
  Future signIn(role, email, password) async {
    var url = Uri.parse(
        '$path/UM/login?status=$role&email=$email&password=$password');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var message = json.decode(response.body)['message'];
      var body = json.decode(response.body)['data'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }

  // SignUp Admin
  Future signUpAdmin(
      name, email, password, buildingName, address, biography) async {
    var url = Uri.parse('$path/UM/sign-up-admin-bd');
    final response = await http.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
      'BuildingName': buildingName,
      'Address': address,
      'Biography': biography,
    });
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var message = json.decode(response.body)['message'];
      var body = json.decode(response.body)['data'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }

  // SignUp Postman
  Future signUpPostman(name, email, password) async {
    var url = Uri.parse('$path/UM/sign-up-postman');
    final response = await http.post(url, body: {
      'name': name,
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      var status = json.decode(response.body)['status'];
      var message = json.decode(response.body)['message'];
      var body = json.decode(response.body)['data'];
      return [status, message, body];
    } else {
      return "Couldn't connect to the server, failed to fetch API!";
    }
  }
}
