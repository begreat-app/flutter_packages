import 'package:event_bus/bus/event_bus.dart';

///
///

abstract class ErrorProvider {
  final EventBus<dynamic> _errorBus = EventBus();

  void showError(dynamic error) {
    _errorBus.add(error);
  }

  void disposeErrorProvider() {
    _errorBus.dispose();
  }
}
