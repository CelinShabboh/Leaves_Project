import 'package:dartz/dartz.dart';
import 'package:dental_project/core/data/models/common_response.dart';
import 'package:dental_project/core/enums/request_type.dart';
import 'package:dental_project/core/utils/network_util.dart';


class UserRepository {
  Future<Either<String, bool>> UserSignUp({
    required String name,
    required String phone,
    required String governorate,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        route: 'auth/user/sign-up',
        body: {
          "name": name,
          "phone": phone,
          "governorate": governorate,
          "password": password,
        },
      ).then(
        (response) {
          CommonResponse<Map<String, dynamic>> commonResponse =
              CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(true);
          } else {
            return Left(commonResponse.message);
          }
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
