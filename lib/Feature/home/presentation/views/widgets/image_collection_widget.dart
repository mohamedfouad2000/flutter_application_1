import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/Feature/home/presentation/manager/cubit/home_cubit_cubit.dart';
import 'package:flutter_application_1/Feature/home/presentation/manager/cubit/home_cubit_state.dart';
import 'package:flutter_application_1/Feature/home/presentation/views/widgets/my_network_image_widget.dart';
import 'package:flutter_application_1/core/utils/size_config.dart';
import 'package:flutter_application_1/core/widgets/eroor_widget.dart';

class ImageCollection extends StatelessWidget {
  const ImageCollection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is HomeSucc) {
          return GridView.count(
            primary: true,
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 3 : 4,
            crossAxisSpacing: 15.0,
            physics: const BouncingScrollPhysics(),
            mainAxisSpacing: 15.0,
            childAspectRatio: SizeConfig.defaultSize! >= 14 ? 1.5 : 1,
            children: List.generate(
              state.model.data!.images!.length,
              (index) {
                return MyNetworkImage(
                  image: state.model.data!.images![index],
                );
              },
            ),
          );
        } else if (state is HomeEroor) {
          return const Center(
            child: EmptyWidget(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
