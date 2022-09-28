import 'package:clean_code_practice/core/error/failure.dart';
import 'package:clean_code_practice/feature/user_detail/domain/entities/user_entities.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
 Future<Either<Failure,UserEntity>> getUserInfo({required int id});
}
