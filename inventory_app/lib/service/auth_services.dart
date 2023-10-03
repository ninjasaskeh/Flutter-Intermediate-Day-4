import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventory_app/model/response_login.dart';

  final host = "192.168.70.14";
class AuthServices {

  Future<ResponseLogin?> login(String email, String password) async {
    final uri = Uri.http(host, "server_inventory/index.php/api/login");
    final response = await http.post(uri, body: {
      'email' : email,
      'password' : password
    },);
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseLogin responseLogin = ResponseLogin.fromJson(decode);
      return responseLogin;
    } else {
      return null;
    }
  }
}