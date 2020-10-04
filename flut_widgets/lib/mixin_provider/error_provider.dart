import 'package:event_bus/bus/event_bus.dart';

///
///

mixin ErrorProviderMixin {
  final EventBus<dynamic> errorBus = EventBus();

  ///
  void showError(dynamic error) {
    errorBus.add(error);
  }

  void disposeErrorProvider() {
    errorBus.dispose();
  }
}
