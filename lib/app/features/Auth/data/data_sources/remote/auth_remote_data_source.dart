import 'package:quirckly/app/core/constant/api.dart';
import 'package:quirckly/app/features/Auth/data/models/request/login_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/request/register_request_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/login_response_model.dart';
import 'package:quirckly/app/features/Auth/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSource(this.client);

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };

      var uri = Uri.parse(loginUrl);
      final response = await http.post(
        uri,
        body: request.toRawJson(),
        headers: headers,
      );

      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromRawJson(response.body);
        return loginResponseModel;
      }

      if (response.statusCode == 400) {
        throw Exception("Unauthorized: Email Or Password Is Wrong");
      }

      throw Exception("Unexpected error: ${response.statusCode}");
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }

  Future<RegisterResponseModel> register(RegisterRequestModel request) async {
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };

      var uri = Uri.parse(registerUrl);
      final response = await http.post(
        uri,
        body: request.toRawJson(),
        headers: headers,
      );

      if (response.statusCode == 200) {
        RegisterResponseModel registerResponseModel =
            RegisterResponseModel.fromRawJson(response.body);
        return registerResponseModel;
      }
      throw Exception("Unexpected error: ${response.statusCode}");
    } catch (e) {
      throw Exception("Network error: $e");
    }
  }
}
