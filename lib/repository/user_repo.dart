import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:stocks/api/constants.dart';
import 'package:stocks/model/user_model.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<UserModel?> login(String email, String password) async {
    final response = await _dio
        .post(loginEndpoint, data: {"identifier": email, "password": password});
    final user = UserModel.fromJson(response.data['user']);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("jwt", response.data['jwt']);
    return user;
  }
}
