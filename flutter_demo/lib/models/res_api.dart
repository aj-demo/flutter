
class ResApi<T> {
  final int code;
  final String message;
  final T data;
  const ResApi({
    required this.code,
    required this.message,
    required this.data,
  });
}