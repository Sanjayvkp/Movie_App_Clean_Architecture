import 'package:movie_application/core/exception/base_exception.dart';

class SignOutException extends BaseException {
  final String code;
  SignOutException(this.code, super.message);
}