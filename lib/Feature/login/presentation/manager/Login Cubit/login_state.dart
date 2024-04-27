import 'package:flutter_application_1/Feature/login/data/model/user_model/user_model.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSucc extends LoginState {
  final UserModel model;
  LoginSucc(this.model);
}

final class LoginEroor extends LoginState {
  final String msq;
  LoginEroor(this.msq);
}
