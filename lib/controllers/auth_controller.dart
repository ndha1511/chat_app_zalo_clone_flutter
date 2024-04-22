import 'package:zalo_clone_flutter/models/token.dart';
import 'package:zalo_clone_flutter/services/token_service.dart';

class AuthController {

  final ITokenService tokenService;

  const AuthController({required this.tokenService});

  Future<bool> isLoginSuccess(String email, String password) async {
    try {
      Token token = await tokenService.getToken(email, password);
      storageToken(token);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  
  }

  void storageToken(Token token) async {
    
  }

}