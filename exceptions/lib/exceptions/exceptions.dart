///
class BaseException implements Exception {
  BaseException(this.message);
  final String message;
}

///
class NoNetworkException extends BaseException {
  NoNetworkException() : super('No network exception');
}

///
class FileNotFoundException extends BaseException {
  FileNotFoundException() : super('File not found exception');
}

///
class ErrorCodeException extends BaseException {
  final String code;

  ErrorCodeException(this.code) : super('Error code exception: $code');
}

class ErrorIntCodeException extends BaseException {
  final int code;

  ErrorIntCodeException(this.code) : super('Error code exception: $code');
}

///
class ErrorDataException extends BaseException {
  final Map<String, dynamic> data;

  ErrorDataException(this.data) : super('Error data exception $data');
}
