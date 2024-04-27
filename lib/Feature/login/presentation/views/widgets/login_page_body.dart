import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/login/presentation/views/widgets/background_image_widget.dart';
import 'package:flutter_application_1/Feature/login/presentation/views/widgets/login_card_widget.dart';
import 'package:flutter_application_1/core/constans/const.dart';

import 'package:flutter_application_1/core/utils/size_config.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody(
      {super.key,
      required this.usercontroller,
      required this.passwordcontroller,
      required this.formkey});
  final TextEditingController usercontroller;
  final TextEditingController passwordcontroller;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              child: BackGroundImage(),
            ),
            Positioned(
              top: SizeConfig.screenHeight! / 5,
              child: Text(
                ConstString.gallary,
                style: StylesData.font40,
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: SizeConfig.screenHeight! / 2,
              left: 30,
              right: 30,
              child: LoginCard(
                  formkey: formkey,
                  usercontroller: usercontroller,
                  passwordcontroller: passwordcontroller),
            ),
          ],
        ),
      ),
    );
  }
}
