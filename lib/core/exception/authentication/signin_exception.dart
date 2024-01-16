import 'package:movie_application/core/exception/base_exception.dart';

class SigninException extends BaseException {
  final String code;
  SigninException(this.code, super.message);
}
