import 'package:dartz/dartz.dart';

class Result<T> {
  late Either<T, Failure> result;

  Result(dynamic response) {
    if (response is Failure) {
      result = Right(response);
    } else {
      result = Left(response);
    }
  }

  Result.success(T response) {
    result = Left(response);
  }

  Result.failure(Failure failure) {
    result = Right(failure);
  }

  Result.exception(Exception e) {
    result = Right(Failure(-1, e.toString()));
  }
}

class Failure{
  int errorCode;
  String message;
  Failure(this.errorCode, this.message);

  @override
  String toString() {
    return "ErrorCode: $errorCode\nMessage: $message";
  }
}