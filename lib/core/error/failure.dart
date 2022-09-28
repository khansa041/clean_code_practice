import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class CacheFailure extends Failure {
  final String message;
  const CacheFailure({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
