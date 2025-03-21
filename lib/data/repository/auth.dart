import 'package:clean_arch/data/models/signup_req_params.dart';
import 'package:clean_arch/data/source/auth_api_service.dart';
import 'package:clean_arch/domain/repository/auth.dart';
import 'package:clean_arch/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    return sl<AuthApiService>().signup(signupReqParams);
  }
}
