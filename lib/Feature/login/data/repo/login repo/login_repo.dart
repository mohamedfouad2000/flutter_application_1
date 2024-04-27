import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Feature/login/data/model/user_model/user_model.dart';
import 'package:flutter_application_1/core/errors/failures.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> login(String username, String password);
}
