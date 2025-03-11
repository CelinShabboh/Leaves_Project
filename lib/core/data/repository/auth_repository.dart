// import 'package:dartz/dartz.dart';
// import 'package:dental_project/core/data/models/common_response.dart';
// import 'package:dental_project/core/enums/request_type.dart';
// import 'package:dental_project/core/utils/network_util.dart';

// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// import '../network/network_config.dart';

// class AuthRepository {
//   Future<Either<String, Tokens>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         route: 'auth/doctor/login',
//         body: {
//           'email': email,
//           'password': password,
//         },
//       ).then((value) async {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(value);

//         if (commonResponse.getStatus) {
//           Tokens tokens = Tokens.fromJson(commonResponse.data ?? {});

//           return Right(tokens);
//         } else {
//           return Left(commonResponse.message);
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }

//   Future<Either<String, RefreshToken>> refreshToken(String refreshToken) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         route: 'auth/user/refresh',
//         body: {'refresh': refreshToken},
//         //headers: NetworkConfig.getHeaders(type: RequestType.POST),
//       ).then((value) async {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(value);

//         if (commonResponse.getStatus) {
//           RefreshToken tokens =
//               RefreshToken.fromJson(commonResponse.data ?? {});

//           return Right(tokens);
//         } else {
//           return Left(commonResponse.message);
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }

//   Future<Either<String, Tokens>> user_login({
//     required String phone,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         route: 'auth/user/login',
//         body: {
//           'phone': phone,
//           'password': password,
//         },
//         // headers: NetworkConfig.getHeaders(
//         //   type: RequestType.POST,
//         //   needAuth: true,
//         // ),
//       ).then((value) {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(value);

//         if (commonResponse.getStatus) {
//           return Right(Tokens.fromJson(commonResponse.data ?? {}));
//         } else {
//           return Left(commonResponse.message);
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }

//   Future<Either<String, UserInfo>> user_login_info({
//     required String phone,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         route: 'auth/user/login',
//         body: {
//           'phone': phone,
//           'password': password,
//         },
//       ).then((value) {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(value);

//         if (commonResponse.getStatus) {
//           return Right(UserInfo.fromJson(commonResponse.data ?? {}));
//         } else {
//           return Left(commonResponse.message);
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }

//   Future<Either<String, bool>> signUp({
//     required String email,
//     required String name,
//     required String phone,
//     required String governorate,
//     required String university,
//     required String collegeyear,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         route:
//             'auth/doctor/sign-up', // تغيير الطريقة إلى الطريقة الصحيحة لعملية Sign up
//         // headers: NetworkConfig.getHeaders(
//         //   type: RequestType.POST,
//         //   needAuth: false,
//         // ),
//         body: {
//           "email": email,
//           "name": name,
//           "phone": phone,
//           "governorate": governorate,
//           "university": university,
//           "collegeyear": collegeyear,
//           "password": password,
//         },
//       ).then(
//         (response) {
//           CommonResponse<Map<String, dynamic>> commonResponse =
//               CommonResponse.fromJson(response);

//           if (commonResponse.getStatus) {
//             return Right(true);
//           } else {
//             return Left(commonResponse.message);
//           }
//         },
//       );
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
// }
