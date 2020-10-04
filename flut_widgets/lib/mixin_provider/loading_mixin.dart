import 'package:rxdart/rxdart.dart';

///
mixin LoadingProviderMixin {
  final BehaviorSubject<bool> _loading = BehaviorSubject.seeded(false);

  Stream<bool> get loading => _loading;

  void emitLoadingStatus(bool loading) {
    _loading.value = loading ?? false;
  }

  ///
  disposeLoadingProviderMixin() {
    _loading.close();
  }
}
