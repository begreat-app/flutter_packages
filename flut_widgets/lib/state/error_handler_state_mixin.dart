import 'dart:async';

import 'package:flutter/material.dart';
import '../mixin_provider/index.dart';
import '../dialogs/index.dart';

class DisplayDialogModel {
  final String title;
  final String content;
  final String positiveBtnText;

  DisplayDialogModel({this.title, this.content, this.positiveBtnText});
}

///
mixin ErrorHandlerStateMixin<T extends StatefulWidget> on DialogStateMixin<T> {
  ///
  ErrorProviderMixin get errorProvider;

  DisplayDialogModel errorToDialogModel(dynamic error);

  StreamSubscription _subscription;

  void initErrorHandlerStateMixin() {
    _subscription = errorProvider.errorBus.event.listen(_onErrorReceived);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  ///
  void _onErrorReceived(dynamic error) async {
    final DisplayDialogModel model = errorToDialogModel(error);

    if (model == null) return;

    showInfoDialog(
      title: model.title,
      content: model.content,
      btnText: model.positiveBtnText,
    );
  }
}
