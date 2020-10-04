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

abstract class EventBus<T> {
  factory EventBus() => _EventBusImpl<T>();

  void add(T data);

  Stream<T> get event;

  void dispose();
}

///
class _EventBusImpl<T> implements EventBus<T> {
  //
  factory _EventBusImpl() {
    // ignore: close_sinks
    BehaviorSubject<Event<T>> subject = BehaviorSubject();
    return _EventBusImpl._(
      subject,
      event: subject.map((event) => event?.unHandledData),
    );
  }

  _EventBusImpl._(this._subject, {this.event});

  final BehaviorSubject<Event<T>> _subject;

  @override
  final Stream<T> event;

  @override
  void add(T data) {
    _subject.add(Event(data));
  }

  @override
  void dispose() {
    _subject.close();
  }
}
