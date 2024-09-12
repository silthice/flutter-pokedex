class AppExceptions implements Exception {
  final String? _prefix;
  final String? _message;

  AppExceptions([this._prefix, this._message]);

  @override
  String toString() {
    return '$_prefix$_message';
  }

}

class InternetException extends AppExceptions {
  InternetException([String? message]) : super(message, 'Internet Errors');
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, 'Request time out');
}

class ServerError extends AppExceptions {
  ServerError([String? message]) : super(message, 'Internal server occured');
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url provided');
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message, 'Failed to fetch data from server');
}