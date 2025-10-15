import 'package:dio/dio.dart';
import '../../../ui/shared/shared_widgets/app_url.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: 15000), 
      receiveTimeout: const Duration(milliseconds: 15000),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Dio get instance => _dio;
}
