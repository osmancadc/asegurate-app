class HttpResponse<T> {
  final int statusCode;
  final T? data;
  final String errorMessage;

  HttpResponse(this.statusCode, this.data, this.errorMessage);

  static HttpResponse<T> success<T>(int statusCode, T data) => HttpResponse(
        statusCode,
        data,
        '',
      );

  static HttpResponse<T> fail<T>({
    required int statuscode,
    required String message,
  }) =>
      HttpResponse(
        statuscode,
        null,
        message,
      );
}
