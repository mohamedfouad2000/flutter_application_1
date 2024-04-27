import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/Feature/login/data/model/user_model/user_model.dart';
import 'package:flutter_application_1/Feature/login/data/repo/login%20repo/login_repo.dart';
import 'package:flutter_application_1/core/constans/const.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/core/remote/dio_helper.dart';

class LoginRepoImp implements LoginRepo {
  @override
  Future<Either<Failure, UserModel>> login(
      String username, String password) async {
    UserModel model;
    try {
      print('the data is  $username $password');
      Response<dynamic> res = await DioHelper.postData(
        url: ConstString.loginUrl,
        data: FormData.fromMap({
          'email': username,
          'password': password,
        }),
      );
      // alfred71@example.org
      print('the data is  ${res.data}');
      model = UserModel.fromJson(res.data);
      return right(model);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }
}
