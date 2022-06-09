import '../entities/entities.dart';

abstract class Authentication {
  Future<void> auth(AuthenticationParams params);
}

class AuthenticationParams {
  final String email;
  final String secret;

  AuthenticationParams({
    required this.email,
    required this.secret,
  });
}
