import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/Feature/home/data/repo/home_page_repo.dart';
import 'package:flutter_application_1/Feature/home/presentation/manager/cubit/home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit(this.homrepo) : super(HomeCubitInitial());
  final HomeRepo homrepo;
  Future<void> homeData() async {
    emit(HomeLoading());

    var result = await homrepo.getHomeImage();
    print('////////////*///////////////////////****************');
    result.fold((failure) {
      print(failure.msq);
      emit(HomeEroor(failure.msq));
    }, (status) {
      emit(HomeSucc(status));
    });
  }

  Future<void> uploadImage({required File file}) async {
    emit(UploadImageLoading());

    var result = await homrepo.uploadImage(file: file);
    print('////////////*///////////////////////****************');
    result.fold((failure) {
      print(failure.msq);
      emit(UploadImageEroor(failure.msq));
    }, (status) {
      emit(UploadImageSucc(status));
    });
  }
}
