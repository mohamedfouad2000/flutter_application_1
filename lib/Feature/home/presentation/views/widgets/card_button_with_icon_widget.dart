import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/home/presentation/views/widgets/custom_dialog_widget.dart';
import 'package:flutter_application_1/Feature/login/presentation/views/login_page.dart';
import 'package:flutter_application_1/core/utils/components.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class CardButtonWithIcon extends StatelessWidget {
  final String text;
  final String image;
  final bool isLogout;

  const CardButtonWithIcon({
    super.key,
    required this.text,
    required this.image,
    required this.isLogout,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isLogout) {
          var x = const CustomDialog();
          showDialog(
              context: context,
              barrierColor: Colors.transparent,
              builder: (BuildContext context) {
                return x;
              }).then((value) {});
        } else {
          navpushWithRemove(context, const LoginPage());
        }
      },
      child: Container(
        height: 39.85,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: const Alignment(-1.00, 0.00),
            end: const Alignment(1, 0),
            colors: [
              Colors.white.withOpacity(0.4313725531101227),
              Colors.white.withOpacity(0.5686274766921997)
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 28,
              width: 30,
              image: AssetImage(image),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: StylesData.font20,
            ),
          ],
        ),
      ),
    );
  }
}
