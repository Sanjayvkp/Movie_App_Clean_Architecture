import 'package:movie_application/core/exception/base_exception.dart';

class SignUpException extends BaseException {
  final String code;
  SignUpException(this.code, super.message);
}
