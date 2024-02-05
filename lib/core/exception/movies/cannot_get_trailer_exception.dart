import 'package:movie_application/core/exception/base_exception.dart';

final class CannotGetTrailerException extends BaseException {
  final String code;
  CannotGetTrailerException(this.code, super.message);
}
