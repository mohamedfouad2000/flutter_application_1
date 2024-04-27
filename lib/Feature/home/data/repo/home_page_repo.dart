import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Feature/home/data/models/home_image_model/home_image_model.dart';
import 'package:flutter_application_1/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeImageModel>> getHomeImage();
  Future<Either<Failure, String>> uploadImage({
    required File file,
  });
}
