import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Event<T> {
  final T _data;

  bool _isHandled = false;

  Event(this._data)
      : this._isHandled = false,
        super();

  T get unHandledData {
    if (_isHandled == false) {
      _isHandled = true;
      return _data;
    }
    return null;
  }
}

typedef OnEventDataReceiver<T> = void Function(T data);

abstract class EventBus<T> {
  factory EventBus() => _EventBusImpl<T>();

  void add(T data);

  void addReceiver(OnEventDataReceiver<T> receiver);

  void dispose();
}

///
class _EventBusImpl<T> implements EventBus<T> {
  //
  _EventBusImpl() : this._subject = BehaviorSubject.seeded(null) {
    _subscription = _subject.listen(_onEventReceived);
  }

  final BehaviorSubject<Event<T>> _subject;
  StreamSubscription _subscription;
  final List<OnEventDataReceiver<T>> _receivers = [];

  @override
  void add(T data) {
    _subject.add(Event(data));
  }

  @override
  void addReceiver(OnEventDataReceiver<T> receiver) {
    if (receiver != null) {
      _receivers.add(receiver);
    }
  }

  @override
  void dispose() {
    _receivers.clear();
    _subscription?.cancel();
    _subject.close();
  }

  ///
  _onEventReceived(Event<T> event) {}
}
