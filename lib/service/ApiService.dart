import 'dart:developer';
import 'package:http/http.dart' as http;

import '../model/UserModel.dart';

class ApiConstants {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';
}

class ApiService {
  Future<List<UserModel>?> find() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> list = userModelFromJson(response.body);
        return list;
      }
    } catch(e) {
      log(e.toString());
    }
    return null;
  }
}