class SignupReqParams {
  final String email;
  final String password;
  final String name;

  SignupReqParams(
      {required this.email, required this.password, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
    };
  }
}
