import 'package:dental_project/core/data/repository/shared_prefrence_repository.dart';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/views/LoginView/login_view_controller/login_cubit.dart';
import 'package:dental_project/ui/views/LoginView/login_view_controller/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();

    _emailFocusNode.addListener(() => setState(() {}));
    _passwordFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = Get.find<SharedPrefrenceRepository>();

    return BlocProvider(
      create: (_) => LoginCubit(prefs),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {},
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'assets/images/pngs/welcome.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Please Login To Your Account",
                      style: GoogleFonts.cairo(
                        fontSize: 20,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "USERNAME / EMAIL",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return TextField(
                        focusNode: _emailFocusNode,
                        onChanged: context.read<LoginCubit>().setEmail,
                        cursorColor: AppColors.mainColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.mainColor),
                          ),
                          hintText: "Enter your email",
                          errorText: state.emailError,
                          suffixIcon: Icon(
                            Icons.email,
                            color: _emailFocusNode.hasFocus
                                ? AppColors.mainColor
                                : AppColors.greyColor,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "PASSWORD",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return TextField(
                        focusNode: _passwordFocusNode,
                        onChanged: context.read<LoginCubit>().setPassword,
                        obscureText: state.isPasswordHidden,
                        cursorColor: AppColors.mainColor,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                const BorderSide(color: AppColors.mainColor),
                          ),
                          hintText: "Enter your password",
                          errorText: state.passwordError,
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _passwordFocusNode.hasFocus
                                  ? AppColors.mainColor
                                  : AppColors.greyColor,
                            ),
                            onPressed: context
                                .read<LoginCubit>()
                                .togglePasswordVisibility,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Checkbox(
                            value: state.isRememberMeChecked,
                            activeColor: AppColors.checkBoxColor,
                            onChanged: (value) => context
                                .read<LoginCubit>()
                                .toggleRememberMe(value ?? false),
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(color: Color(0xFFAAAAAA)),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              // TODO: Navigate to forget password screen
                            },
                            child: const Text(
                              "Forget Password?",
                              style: TextStyle(
                                color: AppColors.mainColor,
                                height: 2,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.mainColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: state.isLoading
                              ? null
                              : context.read<LoginCubit>().login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: state.isLoading
                              ? const CircularProgressIndicator(
                                  color: AppColors.whiteColor)
                              : Text(
                                  "Login",
                                  style: GoogleFonts.cairo(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state.error != null &&
                          state.emailError == null &&
                          state.passwordError == null) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            state.error!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
