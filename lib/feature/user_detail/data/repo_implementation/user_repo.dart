import 'package:clean_code_practice/core/error/exceptions.dart';
import 'package:clean_code_practice/core/error/failure.dart';
import 'package:clean_code_practice/feature/user_detail/data/data_sources/user_detail_remote_data_source.dart';
import 'package:clean_code_practice/feature/user_detail/domain/entities/user_entities.dart';
import 'package:clean_code_practice/feature/user_detail/domain/repository/user_detail_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';

class UserRepoImp implements UserRepository {
  final UserDetailRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  UserRepoImp({required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, UserEntity>> getUserInfo({required int id}) async {
    try {
      final remoteUserData = await remoteDataSource.getUserInfo(id: id);
      return Right(remoteUserData);
    } on ServerException {
      return const Left(ServerFailure(message: 'server failure'));
    }
  }
}
