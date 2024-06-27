class Result<T> {
  final bool isSuccess;
  final T? data;
  final String? message;
  final Exception? exception;

  Result({
    required this.isSuccess,
    this.data,
    this.message,
    this.exception,
  });

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
}
