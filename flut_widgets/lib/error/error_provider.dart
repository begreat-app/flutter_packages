import 'package:event_bus/bus/event_bus.dart';
import 'package:flutter/material.dart';

///
///

abstract class ErrorProvider {
  final EventBus<dynamic> _errorBus = EventBus();

  ValueChanged<dynamic> _callback;

  ///
  void showError(dynamic error) {
    _errorBus.add(error);
  }

  void addErrorReceiveCallback(ValueChanged<dynamic> callback) {}

  void disposeErrorProvider() {
    _callback = null;
    _errorBus.dispose();
  }
}
