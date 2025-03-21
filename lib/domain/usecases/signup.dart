import 'package:clean_arch/core/usecase/usecase.dart';
import 'package:clean_arch/data/models/signup_req_params.dart';
import 'package:clean_arch/domain/repository/auth.dart';
import 'package:clean_arch/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase implements Usecase<Either, SignupReqParams> {
  
  @override
  Future<Either> call(SignupReqParams? params) async =>
    sl<AuthRepository>().signup(params!);
}
