import 'package:dental_project/core/data/repository/leave_repository.dart';
import 'package:dental_project/core/data/repository/shared_prefrence_repository.dart';
import 'package:dental_project/ui/views/leaves_view/leaves_controller/leaves_cubit.dart';
import 'package:dental_project/ui/views/leaves_view/leaves_view/leaves_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import 'package:dental_project/ui/shared/shared_widgets/app_url.dart';
import 'package:get/get.dart';

class LoginCubit extends Cubit<LoginState> {
  final SharedPrefrenceRepository _prefs;
  bool _hasNavigated = false;

  LoginCubit(this._prefs) : super(const LoginState());

  void setEmail(String email) => emit(state.copyWith(email: email));
  void setPassword(String password) => emit(state.copyWith(password: password));
  void togglePasswordVisibility() =>
      emit(state.copyWith(isPasswordHidden: !state.isPasswordHidden));

  void toggleRememberMe(bool value) {
    emit(state.copyWith(isRememberMeChecked: value));
    _prefs.setRememberMe(value);
  }

  Future<void> login() async {
  if (_hasNavigated) return;

  final emailValid = state.email.trim().isNotEmpty;
  final passwordValid = state.password.trim().isNotEmpty;

  if (!emailValid || !passwordValid) {
    emit(state.copyWith(
      emailError: emailValid ? null : 'Email is required',
      passwordError: passwordValid ? null : 'Password is required',
      error: null,
    ));
    return;
  }

  emit(state.copyWith(
    isLoading: true,
    error: null,
    successMessage: null,
    emailError: null,
    passwordError: null,
  ));

  try {
    final dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Content-Type': 'application/json'},
    ));

    final response = await dio.post(
      '/v1/Auth/login',
      data: {
        "username": state.email,
        "password": state.password,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.data;
      if (data['response'] == 1) {
        final accessToken = data['data']['accessToken'] ?? '';
        final refreshToken = data['data']['refreshToken'] ?? '';
        final user = data['data']['user'] ?? {};
        final employee = user['employee'] ?? {};
        final company = employee['company'] ?? {};
        final department = employee['department'] ?? {};

        final employeeId = employee['id'] ?? 0;
        final employeeName = employee['fullName'] ?? '';
        final companyId = company['id'] ?? 0;
        final departmentId = department['id'] ?? 0;

        final accessTokenExpiry =
            DateTime.now().add(const Duration(minutes: 15));

        _prefs.setLoginData(
          accessToken: accessToken,
          refreshToken: refreshToken,
          employeeId: employeeId,
          employeeName: employeeName,
          companyId: companyId,
          departmentId: departmentId,
          accessTokenExpiry: accessTokenExpiry,
        );

        if (state.isRememberMeChecked) {
          _prefs.setSavedPassword(state.password);
          _prefs.setname(state.email);
        }

        _hasNavigated = true;

        Future.microtask(() {
          Get.offAll(() => BlocProvider(
                create: (_) => LeavesCubit(LeaveRepository()),
                child: LeavesView(
                  employeeName: _prefs.getEmployeeName() ?? '',
                  employeeId: _prefs.getEmployeeId() ?? 0,
                  companyId: _prefs.getCompanyId() ?? 0,
                  departmentId: _prefs.getDepartmentId() ?? 0,
                  token: _prefs.getAccessToken() ?? '',
                ),
              ));
        });

        emit(state.copyWith(
          isLoading: false,
          successMessage: data['message'],
          error: null,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          error: data['message'],
        ));
      }
    } else {
      emit(state.copyWith(
        isLoading: false,
        error: 'Server error ${response.statusCode}',
      ));
    }
  } catch (e) {
    emit(state.copyWith(
      isLoading: false,
      error: e.toString(),
    ));
  }
}
}
