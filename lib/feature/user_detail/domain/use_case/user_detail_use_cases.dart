import 'package:clean_code_practice/feature/user_detail/domain/entities/user_entities.dart';
import 'package:clean_code_practice/feature/user_detail/domain/repository/user_detail_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repository/user_detail_repository.dart';

class GetUserDetail {
  final UserRepository repository;
  GetUserDetail(this.repository);

  Future<Either<Failure, UserEntity>> call({required int id}) async {
    return  repository.getUserInfo(id: id);
  }
}
