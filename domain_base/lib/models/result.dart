///
class Result<T> {
  final T data;

  final Object error;

  Result({this.data, this.error});

  @override
  String toString() {
    return "Result: data $data error $error";
  }

  /// Throw the error if there is error otherwise return data
  T get dataOrThrow {
    if (error != null) throw error;
    return data;
  }
}
