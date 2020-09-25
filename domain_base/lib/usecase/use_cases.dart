import '../models/result.dart';

/// Use case class take param [Param]
/// and result [R]
abstract class ParamUseCase<Param, R> {
  /// Callable function
  Future<Result<R>> call(Param param) async {
    try {
      final result = await execute(param);
      return Result(data: result);
    } catch (e) {
      return Result(error: e);
    }
  }

  /// Child class need to override this function
  Future<R> execute(Param param);
}

///
abstract class OptionalParamUseCase<Param, R> {
  /// Callable function
  Future<Result<R>> call([Param param]) async {
    try {
      final result = await execute(param);
      return Result(data: result);
    } catch (e) {
      return Result(error: e);
    }
  }

  /// Child class need to override this function
  Future<R> execute(Param param);
}

abstract class UseCase<R> {
  /// Callable function
  Future<Result<R>> call() async {
    try {
      final result = await execute();
      return Result(data: result);
    } catch (e) {
      return Result(error: e);
    }
  }

  /// Child class need to override this function
  Future<R> execute();
}

///
typedef UseCaseUnWrapFunction<R> = Future<Result<R>> Function();

class UseCaseUnWrap<R> {
  UseCaseUnWrap(this.usecase);

  final UseCaseUnWrapFunction<R> usecase;

  Future<R> call() => usecase().then((value) => value?.dataOrThrow);
}
