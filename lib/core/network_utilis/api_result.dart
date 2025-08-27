abstract class ApiResult<T>{}

class SuccessApiResult<T> extends ApiResult<T>{
  T? data;
  SuccessApiResult(this.data);
}
class ErrorApiResult<T> extends ApiResult<T>{
  String errorMessage;
  ErrorApiResult(this.errorMessage);
}
class LoadingApiResult<T> extends ApiResult<T>{}
class InitialApiResult<T> extends ApiResult<T>{}
