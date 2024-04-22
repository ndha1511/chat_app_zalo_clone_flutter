import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zalo_clone_flutter/controllers/auth_controller.dart';
import 'package:zalo_clone_flutter/services/token_service.dart';
import 'package:zalo_clone_flutter/utils/request_api.dart';


final _formKey = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;
  String _errorLogin = "";

  void submitForm(context) async {
    if(validationFrom()) {
      final AuthController authController = AuthController(
        tokenService: TokenService(requestApi: RequestApi(contentType: "application/json"))
      );
      setState(() {
        _loading = true;
      });
      bool success = await authController.isLoginSuccess(
        _emailController.text.trim(), _passwordController.text.trim());
      if(success) {
        setState(() {
          _loading = false;
        });
        Navigator.of(context).pushNamedAndRemoveUntil("/chat", (route) => false);
      } else {
        setState(() {
          _loading = false;
          _errorLogin = "Email hoặc mật khẩu không chính xác";
        });
      }
      
    }
  }

  bool validationFrom() {
    if(_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      progressIndicator: const CircularProgressIndicator(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, 
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Vui lòng nhập email của bạn";
                  }
                  return null;
                } ,
                decoration: const InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18)
                
                ),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Vui lòng nhập mật khẩu của bạn";
                  }
                  return null;
                } ,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Mật khẩu",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18)
                
                ),
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 15,),
              Text(_errorLogin, style: const TextStyle(color: Colors.red, fontSize: 16),),
              Row(
                children: [
                  MaterialButton(
                    textColor: Colors.blue,
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Text("Lấy lại mật khẩu", style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              const Expanded(child: SizedBox(),),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    color: Colors.blue,
                    height: 60,
                    minWidth: 60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)
                    ),
                    onPressed: () => submitForm(context),
                    child: const Icon(
                      Icons.arrow_forward, 
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}
