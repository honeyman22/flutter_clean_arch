import 'package:clean_arch/core/constants/api_urls.dart';
import 'package:clean_arch/core/network/dio_client.dart';
import 'package:clean_arch/data/models/signup_req_params.dart';
import 'package:clean_arch/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams signupReqParams);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either> signup(SignupReqParams signupReqParams) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrls.register, data: signupReqParams.toMap());

      return Right(response);
    } on DioException catch (e) {
      print("Hello ${e.response!.data['message']}");
      return Left(e.response!.data['message']);
    }
  }
}
