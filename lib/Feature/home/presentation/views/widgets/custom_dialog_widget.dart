import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/Feature/home/data/repo/home_page_repo_imp.dart';
import 'package:flutter_application_1/Feature/home/presentation/manager/cubit/home_cubit_cubit.dart';
import 'package:flutter_application_1/Feature/home/presentation/manager/cubit/home_cubit_state.dart';
import 'package:flutter_application_1/Feature/home/presentation/views/home_page.dart';
import 'package:flutter_application_1/core/utils/assets_data.dart';
import 'package:flutter_application_1/core/utils/components.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  File? file;
  ImagePicker picker = ImagePicker();

  Future<void> getImage({required ImageSource i}) async {
    // emit(getuserprofileLoading());
    var pickedfile = await picker.pickImage(source: i);
    if (pickedfile != null) {
      setState(() {
        file = File(pickedfile.path);
      });
      print(pickedfile.path);
    } else {
      print("No Image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl()),
      child: BlocConsumer<HomeCubit, HomeCubitState>(
        listener: (context, state) {
          if (state is UploadImageSucc) {
            navpushWithRemove(context, const HomePage());
          }
        },
        builder: (context, state) {
          if (state is UploadImageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Dialog(
              backgroundColor: Colors.transparent.withOpacity(.2),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.4000000059604645),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 184,
                      height: 65,
                      child: InkWell(
                        onTap: () async {
                          await getImage(i: ImageSource.gallery);

                          await BlocProvider.of<HomeCubit>(context)
                              .uploadImage(file: file!);
                          Navigator.pop(context);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 180,
                              height: 184,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFEFD8F9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    height: 30,
                                    width: 30,
                                    image: AssetImage(
                                      AssetsData.gallery,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Gellary',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF4A4A4A),
                                      fontSize: 25,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 184,
                      height: 65,
                      child: InkWell(
                        onTap: () async {
                          await getImage(i: ImageSource.camera);

                          // Navigator.pop(context);
                          await BlocProvider.of<HomeCubit>(context)
                              .uploadImage(file: file!);
                          // Navigator.pop(context);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 180,
                              height: 184,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFEBF6FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            const Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    height: 30,
                                    width: 30,
                                    image: AssetImage(
                                      AssetsData.camera,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Camera',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF4A4A4A),
                                      fontSize: 25,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
