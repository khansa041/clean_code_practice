import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../domain/use_case/user_detail_use_cases.dart';
import '../cubit/user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final String serverFailureMessage = 'Server Failure';
  final String cacheFailureMessage = 'Cache Failure';
  final GetUserDetail getUserDetail;

  UserInfoCubit(this.getUserDetail)
      : super(
          const UserInfoInitialState(message: "Lets start searching info"),
        );

  Future getUserInfo() async {
    emit(UserInfoLoadingState());
    final failureOrUserInfo = await getUserDetail.call(id: 7);
    failureOrUserInfo.fold(
      (l) => emit(
        UserInfoErrorState(
          message: _mapFailureToMessage(l),
        ),
      ),
      (r) => emit(
        UserInfoLoadedState(userEntity: r),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
