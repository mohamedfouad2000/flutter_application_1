import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/login/presentation/views/widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var usercontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return Scaffold(
        body: LoginPageBody(
            usercontroller: usercontroller,
            passwordcontroller: passwordcontroller,
            formkey: formkey));
  }
}
