class LoginState {
  final String email;
  final String password;
  final bool isPasswordHidden;
  final bool isRememberMeChecked;
  final bool isLoading;
  final String? error;
  final String? successMessage; 

  const LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordHidden = true,
    this.isRememberMeChecked = false,
    this.isLoading = false,
    this.error,
    this.successMessage,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordHidden,
    bool? isRememberMeChecked,
    bool? isLoading,
    String? error,
    String? successMessage,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      isRememberMeChecked: isRememberMeChecked ?? this.isRememberMeChecked,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      successMessage: successMessage,
    );
  }
}
