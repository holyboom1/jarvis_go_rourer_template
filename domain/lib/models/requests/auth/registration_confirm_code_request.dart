class RegistrationConfirmCodeRequest {
  String username;
  String passwordOne;
  String passwordTwo;
  String code;

  RegistrationConfirmCodeRequest({
    required this.passwordOne,
    required this.passwordTwo,
    required this.username,
    required this.code,
  });
}
