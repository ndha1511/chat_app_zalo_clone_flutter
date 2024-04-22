import 'package:dio/dio.dart';
import 'package:zalo_clone_flutter/models/token.dart';
import 'package:zalo_clone_flutter/utils/request_api.dart';

abstract class ITokenService {
  Future<Token> getToken(String email, String password);
}

class TokenService implements ITokenService {
  final RequestApi requestApi;

  const TokenService({required this.requestApi});

  // login
  @override
  Future<Token> getToken(String email, String password) async {
    try {
      Dio dio = requestApi.dio;
      final response  = await dio.post(
        "auth/login", 
        data: {"email": email, "password": password}
      );
      if(response.statusCode == 200) {
        final token = Token.fromJson(response.data);
        return token;
      } else {
        throw Exception("Failed to get token: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to get token: ${error.toString()}");
    }
  }
}
