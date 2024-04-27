import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/core/utils/assets_data.dart';
import 'package:flutter_application_1/core/utils/size_config.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      height: SizeConfig.screenHeight! / .2,
      width: double.infinity,
      fit: BoxFit.fill,
      image: const AssetImage(
        AssetsData.color66,
      ),
    );
  }
}
