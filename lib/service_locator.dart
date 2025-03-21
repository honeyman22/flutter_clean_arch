import 'package:clean_arch/core/network/dio_client.dart';
import 'package:clean_arch/data/repository/auth.dart';
import 'package:clean_arch/data/source/auth_api_service.dart';
import 'package:clean_arch/domain/repository/auth.dart';
import 'package:clean_arch/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

//Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
}
