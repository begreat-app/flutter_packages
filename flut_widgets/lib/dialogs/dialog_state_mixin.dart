import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
mixin DialogStateMixin<T extends StatefulWidget> on State<T> {
  ///
  Future<bool> showInfoDialog(
      {@required String title, String content, String btnText}) {
    return showGenericDialog<bool>(
      title: title,
      content: content,
      hasNegativeBtn: false,
      negativeResult: false,
      positiveResult: true,
      positiveText: btnText,
    );
  }

  ///
  Future<bool> showYesNoDialog(
      {@required String title,
      String content,
      String positiveText,
      String negativeText}) {
    return showGenericDialog<bool>(
      title: title,
      content: content,
      hasNegativeBtn: true,
      negativeResult: false,
      positiveResult: true,
      positiveText: positiveText,
      negativeText: negativeText,
    );
  }

  ///
  ///
  Future<T> showGenericDialog<T>({
    @required String title,
    String content,
    String positiveText,
    String negativeText,
    T negativeResult,
    T positiveResult,
    bool hasNegativeBtn = true,
  }) {
    if (Platform.isIOS) {
      return showCupertinoDialog(
          context: context,
          builder: (context) {
            return _buildCupertinoDialog<T>(
              context,
              title: title,
              content: content,
              negativeResult: negativeResult,
              positiveResult: positiveResult,
              hasNegativeBtn: hasNegativeBtn ?? true,
              positiveBtn: positiveText,
              negativeBtn: negativeText,
            );
          });
    }

    return showDialog(
        context: context,
        builder: (context) {
          return _buildMaterialDialog<T>(
            context,
            title: title,
            content: content,
            negativeResult: negativeResult,
            positiveResult: positiveResult,
            hasNegativeBtn: hasNegativeBtn ?? true,
            positiveBtn: positiveText,
            negativeBtn: negativeText,
          );
        });
  }
}

///
extension DialogStateMixinEx on DialogStateMixin {
  Widget _buildMaterialDialog<T>(
    BuildContext context, {
    String title,
    String content,
    String positiveBtn,
    String negativeBtn,
    bool hasNegativeBtn = false,
    T negativeResult,
    T positiveResult,
  }) {
    return AlertDialog(
      title: Text(title ?? ''),
      content: content != null ? Text(content) : null,
      actions: [
        if (hasNegativeBtn == true)
          FlatButton(
              onPressed: () {
                Navigator.pop(context, negativeResult);
              },
              child: Text(negativeBtn ?? 'Cancel')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context, positiveResult);
            },
            child: Text(positiveBtn ?? 'Ok')),
      ],
    );
  }

  Widget _buildCupertinoDialog<T>(
    BuildContext context, {
    String title,
    String content,
    String positiveBtn,
    String negativeBtn,
    bool hasNegativeBtn = false,
    T negativeResult,
    T positiveResult,
  }) {
    return CupertinoAlertDialog(
      title: Text(title ?? ''),
      content: content != null ? Text(content) : null,
      actions: [
        if (hasNegativeBtn == true)
          CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, negativeResult);
              },
              child: Text(negativeBtn ?? 'Cancel')),
        CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context, positiveResult);
            },
            child: Text(positiveBtn ?? 'Ok')),
      ],
    );
  }
}
