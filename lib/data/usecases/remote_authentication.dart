import '../../domain/entities/account_entity.dart';
import '../../domain/usecases/usecases.dart';
import '../http/http.dart';

class RemoteAuthentication implements Authentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({required this.httpClient, required this.url});

  @override
  Future<void> auth(AuthenticationParams params) async {
    await httpClient.request(
      url: url,
      method: 'method',
      bory: RemoteAuthenticationParams.fromDomain(params).toJson(),
    );
  }
}

class RemoteAuthenticationParams {
  final String email;
  final String secret;

  RemoteAuthenticationParams({
    required this.email,
    required this.secret,
  });

  factory RemoteAuthenticationParams.fromDomain(AuthenticationParams params) =>
      RemoteAuthenticationParams(
        email: params.email,
        secret: params.secret,
      );

  Map toJson() => {
        'email': email,
        'password': secret,
      };
}
