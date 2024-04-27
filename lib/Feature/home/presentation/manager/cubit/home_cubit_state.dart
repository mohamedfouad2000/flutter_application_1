import 'package:flutter_application_1/Feature/home/data/models/home_image_model/home_image_model.dart';

sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeLoading extends HomeCubitState {}

final class HomeSucc extends HomeCubitState {
  final HomeImageModel model;
  HomeSucc(this.model);
}

final class HomeEroor extends HomeCubitState {
  final String msq;
  HomeEroor(this.msq);
}

final class UploadImageLoading extends HomeCubitState {}

final class UploadImageSucc extends HomeCubitState {
  final String msq;
  UploadImageSucc(this.msq);
}

final class UploadImageEroor extends HomeCubitState {
  final String msq;
  UploadImageEroor(this.msq);
}
