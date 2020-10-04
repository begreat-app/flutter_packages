import 'package:flutter/material.dart';

abstract class ILifcycleAware {
  void onInitialize();

  void onDispose();
}

///
mixin LifecleOwnerMixin<T extends StatefulWidget> on State<T> {
  List<ILifcycleAware> _list;

  List<ILifcycleAware> onInitLifecycleAwares();

  @override
  void initState() {
    super.initState();
    _list = onInitLifecycleAwares();
    _list?.forEach((element) {
      element?.onInitialize();
    });
  }

  @override
  void dispose() {
    _list?.forEach((element) {
      element?.onDispose();
    });
    super.dispose();
  }
}
