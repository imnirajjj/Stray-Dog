// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:stray_dog_adoption/core/error/app_error.dart';

abstract class UseCase<Type, Param> {
  Future<Either<AppError, Type>> call(Param param);
}

class NoParam {}
