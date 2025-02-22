import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:djangostaging/helpers/constants.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static final AuthService instance = AuthService._internal();
  factory AuthService() => instance;

  Auth0 auth0 = Auth0(auth0Domain!, auth0ClientId!);
  UserProfile? profile;

  AuthService._internal();

  Future init() async {
    final isLoggedIn = await auth0.credentialsManager.hasValidCredentials();
    if (isLoggedIn) {
      final credentials = await auth0.credentialsManager.credentials();
      profile = credentials.user;
    }
    return profile;
  }

  Future login() async {
    if (kDebugMode) {
      print("LOGIN INIT");
    }
    final credentials = await auth0.webAuthentication().login(
          audience: AuthConfig.audience,
          redirectUrl: AuthConfig.callbackUrl,
        );
    if (kDebugMode) {
      print("LOGIN DONE");
    }
    profile = credentials.user;
    if (kDebugMode) {
      print("LOGIN DONE");
    }
    return profile;
  }

  Future signup() async {
    final credentials = await auth0
        .webAuthentication()
        .login(audience: auth0Audience, redirectUrl: AuthConfig.callbackUrl, parameters: {
      'screen_hint': 'signup',
    });
    profile = credentials.user;
    return profile;
  }

  Future logout() async {
    await auth0.webAuthentication().logout(returnTo : AuthConfig.callbackUrl);
    profile = null;
    return;
  }
  
  Future<Credentials> getValidCredentials() async {
    try {
      return await auth0.credentialsManager.credentials();
    } catch (e) {
      if (kDebugMode) {
        print('Get credentials error: $e');
      }
      rethrow;
    }
  }
}
