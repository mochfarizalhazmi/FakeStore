abstract class Status {
  static var success = Success();
  static var noInternet = NoInternet();
  static var error = Error();
  static var tokenExpired = TokenExpired();
}

class Success extends Status {}

class NoInternet extends Status {}

class Error extends Status {}

class TokenExpired extends Status {}

class Result<R> {
  late R data;
  late Status status;

  int code;
  String message;

  Result.success(this.data, {this.message = "", this.code = 200})
      : status = Status.success;

  Result.noInternet(
      {this.message =
          "No internet connection.\nPlease check your connection and try again.",
      this.code = -1})
      : status = Status.noInternet;

  Result.error({Status? status, this.message = "", this.code = -1})
      : status = status ?? Status.error;

  Result.tokenExpired({this.message = "", this.code = 401})
      : status = Status.tokenExpired;
}
