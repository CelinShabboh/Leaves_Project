import 'package:dio/dio.dart';
import 'package:dental_project/core/data/network/dio_client.dart';
import '../models/leave_model.dart';
import '../../../ui/shared/shared_widgets/app_url.dart';

class LeaveRepository {
  final Dio _dio = DioClient.instance;

  Future<LeaveListResponse> fetchLeaves({
    required int companyId,
    required int departmentId,
    required int employeeId,
    required String token,
    int pageNumber = 1,
    int pageSize = 7,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/v1/Leave/List',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'companyId': companyId.toString(),
            'departmentId': departmentId.toString(),
            'employeeId': employeeId.toString(),
            'pageNumber': pageNumber.toString(),
            'pageSize': pageSize.toString(),
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LeaveListResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch leaves: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching leaves: $e');
    }
  }

  Future<Map<String, dynamic>> fetchLeaveCount({
    required int employeeId,
    required String token,
  }) async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseUrl}/v1/Employee/LeaveCount/$employeeId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final rawData = response.data['data'];

        final Map<String, dynamic> data =
            Map<String, dynamic>.from(rawData ?? {});

        final fixedData = data.map((key, value) {
          if (value is double) {
            return MapEntry(key, value.toInt());
          }
          return MapEntry(key, value);
        });

        return fixedData;
      } else {
        throw Exception(
            'Failed to fetch leave count: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching leave count: $e');
    }
  }
}
