import 'package:clean_code_practice/core/network/network_info.dart';
import 'package:clean_code_practice/feature/user_detail/domain/repository/user_detail_repository.dart';
import 'package:clean_code_practice/feature/user_detail/domain/use_case/user_detail_use_cases.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/user_detail/data/data_sources/user_detail_remote_data_source.dart';
import 'feature/user_detail/data/repo_implementation/user_repo.dart';
import 'core/network/network_info.dart';
import 'package:http/http.dart' as http;
import 'feature/user_detail/presentation/cubit/user_info_cubit.dart';
//import 'feature/user_detail/presentation/bloc/user_info_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Features bloc
  sl.registerFactory(() => UserInfoCubit(sl()));
  // sl.registerFactory(() => UserInfoBloc(sl()));
  //use cases
  sl.registerLazySingleton(() => GetUserDetail(sl()));
  //repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepoImp(networkInfo: sl(), remoteDataSource: sl()),
  );
  //data source
  sl.registerLazySingleton<UserDetailRemoteDataSource>(
    () => UserDetailRemoteDataSourceImp(client: sl()),
   );
  // sl.registerLazySingleton<UserInfoEvent>(
  //   () => GetUserInfo(),
  // );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  //! External
  //final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
