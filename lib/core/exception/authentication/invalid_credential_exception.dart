import 'package:movie_application/core/exception/base_exception.dart';

final class InvalidCredentialsException extends BaseException {
  String? errorMsg;
  InvalidCredentialsException({this.errorMsg})
      : super(errorMsg ?? 'Invalid user input');
}
