import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/Feature/home/data/models/home_image_model/home_image_model.dart';
import 'package:flutter_application_1/Feature/home/data/repo/home_page_repo.dart';
import 'package:flutter_application_1/core/constans/const.dart';
import 'package:flutter_application_1/core/errors/failures.dart';
import 'package:flutter_application_1/core/remote/dio_helper.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, HomeImageModel>> getHomeImage() async {
    HomeImageModel model;
    try {
      Response<dynamic> res = await DioHelper.getData(
        url: ConstString.homeUrl,
      );
      // alfred71@example.org
      print('the data is  ${res.data}');
      model = HomeImageModel.fromJson(res.data);
      return right(model);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage({
    required File file,
  }) async {
    // HomeImageModel model;
    try {
      print(file);
      Response<dynamic> res = await DioHelper.postData(
        data: FormData.fromMap({
          'img': await MultipartFile.fromFile(file.path,
              filename: file.path.split('/').last),
        }),
        url: ConstString.uploadUrl,
      );
      // alfred71@example.org
      print('the data is  ${res.data}');

      return right(res.data['message']);
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(msq: e.toString()));
    }
  }
}
