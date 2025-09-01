abstract class ApiResult<T>{
  bool get hasData => this is SuccessApiResult;
  bool get hasError => this is ErrorApiResult;
  bool get isLoading => this is LoadingApiResult;

  T get myData => (this as SuccessApiResult<T>).data!;

  String get myErrorMessage => (this as ErrorApiResult).errorMessage;
}

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
