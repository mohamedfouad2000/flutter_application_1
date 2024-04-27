import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/Feature/home/presentation/views/home_page.dart';
import 'package:flutter_application_1/Feature/login/data/repo/login%20repo/login_repo_imp.dart';
import 'package:flutter_application_1/Feature/login/presentation/manager/Login%20Cubit/login_cubit.dart';
import 'package:flutter_application_1/Feature/login/presentation/manager/Login%20Cubit/login_state.dart';
import 'package:flutter_application_1/core/constans/const.dart';
import 'package:flutter_application_1/core/constans/const_app_model.dart';
import 'package:flutter_application_1/core/utils/components.dart';
import 'package:flutter_application_1/core/utils/size_config.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.usercontroller,
    required this.passwordcontroller,
    required this.formkey,
  });

  final TextEditingController usercontroller;
  final TextEditingController passwordcontroller;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepoImp()),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return Form(
            key: formkey,
            child: Container(
              height: (SizeConfig.screenHeight! / 2.3),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.4000000059604645),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ConstString.login,
                    style: StylesData.font30,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  customTextFormedFiled(
                      controller: usercontroller, hintText: 'User Name'),
                  const SizedBox(
                    height: 10,
                  ),
                  customTextFormedFiled(
                      controller: passwordcontroller,
                      hintText: 'Password',
                      obscureText: true),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).login(
                            email: usercontroller.text,
                            password: passwordcontroller.text);
                      }
                    },
                    child: state is LoginLoading
                        ? const Center(child: CircularProgressIndicator())
                        : customButton(),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, LoginState state) {
          if (state is LoginSucc) {
            if (state.model.token != null) {
              USERMODEL = state.model;
              TOKEN = state.model.token;
              navpushWithRemove(context, const HomePage());
            } else {
              showToastMsq(Msq: 'Oops An Eroor try Again Later !');
            }
          } else if (state is LoginEroor) {
            showToastMsq(Msq: state.msq.toString());
          }
        },
      ),
    );
  }
}
