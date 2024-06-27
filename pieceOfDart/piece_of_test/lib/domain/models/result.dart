class Result<T> {
  late final bool _isSuccess;
  final T? data;
  final String? message;
  final Exception? exception;

  Result({
    bool isSuccess = false,
    this.data,
    this.message,
    this.exception,
  }) {
    _isSuccess = isSuccess;
  }

  factory Result.success(T data) {
    return Result(
      isSuccess: true,
      data: data,
    );
  }

  factory Result.failure(String message, Exception exception) {
    return Result(
      isSuccess: false,
      message: message,
      exception: exception,
    );
  }

  bool isSuccess() {
    return _isSuccess;
  }
}
