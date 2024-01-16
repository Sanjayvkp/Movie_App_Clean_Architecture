import 'package:movie_application/core/exception/base_exception.dart';

final class InvalidCredentialsException extends BaseException {
  InvalidCredentialsException() : super('Invalid user input');
}
