import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/model.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://7food.kz/api/auth/login";

    final response = await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('User not found');
    }
  }
}