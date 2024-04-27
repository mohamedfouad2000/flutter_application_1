import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/Feature/home/data/repo/home_page_repo_imp.dart';
import 'package:flutter_application_1/Feature/home/presentation/manager/cubit/home_cubit_cubit.dart';
import 'package:flutter_application_1/Feature/home/presentation/manager/cubit/home_cubit_state.dart';
import 'package:flutter_application_1/Feature/home/presentation/views/widgets/custom_buttons_widgets.dart';
import 'package:flutter_application_1/Feature/home/presentation/views/widgets/image_collection_widget.dart';
import 'package:flutter_application_1/core/constans/const.dart';
import 'package:flutter_application_1/core/constans/const_app_model.dart';
import 'package:flutter_application_1/core/utils/assets_data.dart';
import 'package:flutter_application_1/core/utils/size_config.dart';
import 'package:flutter_application_1/core/utils/styles.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => HomeCubit(HomeRepoImpl())..homeData(),
        child: BlocConsumer<HomeCubit, HomeCubitState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AssetsData.frame2), fit: BoxFit.fill),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${ConstString.welcom}${USERMODEL?.user?.name}',
                            maxLines: 2,
                            style: StylesData.font32,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const CustomButtons(),
                        const SizedBox(
                          height: 25,
                        ),
                        const Expanded(
                          child: ImageCollection(),
                        ),
                      ],
                    ),
                  ),
                  if (state is HomeSucc)
                    Positioned(
                        top: 40,
                        right: 10,
                        child: state.model.data!.images!.isNotEmpty
                            ? Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white
                                      .withOpacity(0.4000000059604645),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${state.model.data?.images?[(state.model.data?.images?.length)! - 1] ?? ''}')),
                                ),
                              )
                            : Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white
                                      .withOpacity(0.4000000059604645),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  image: const DecorationImage(
                                    image: AssetImage(AssetsData.person),
                                  ),
                                ),
                              ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
