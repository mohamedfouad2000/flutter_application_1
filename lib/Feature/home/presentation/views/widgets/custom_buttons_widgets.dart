import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Feature/home/presentation/views/widgets/card_button_with_icon_widget.dart';
import 'package:flutter_application_1/core/constans/const.dart';
import 'package:flutter_application_1/core/utils/assets_data.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: CardButtonWithIcon(
            image: AssetsData.logout,
            text: ConstString.logout,
            isLogout: true,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
            child: CardButtonWithIcon(
          image: AssetsData.upload,
          text: ConstString.uploadUrl,
          isLogout: false,
        )),
      ],
    );
  }
}
