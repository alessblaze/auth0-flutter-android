import 'package:flutter_dotenv/flutter_dotenv.dart';

var auth0Domain =  dotenv.env['AUTH0_DOMAIN'];
var auth0ClientId = dotenv.env['AUTH0_CLIENT_ID'];
var auth0Audience = dotenv.env['AUTH0_AUDIENCE'];
class AuthConfig {
  static String? domain =  dotenv.env['AUTH0_DOMAIN'];
  static String? clientId = dotenv.env['AUTH0_CLIENT_ID'];
  static const String packageName = 'com.ams.flutterstaging.djangostaging';
  static String? audience = dotenv.env['AUTH0_AUDIENCE'];
  static String get scheme => packageName;
  static String get callbackUrl => '$scheme://$domain/android/$packageName/callback';
}