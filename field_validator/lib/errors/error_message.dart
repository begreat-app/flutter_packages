import 'package:flutter/material.dart';

///
abstract class ValidatorErrorMessage {
  const ValidatorErrorMessage();

  String getError(BuildContext context);
}

///
class StringErrorMessage implements ValidatorErrorMessage {
  const StringErrorMessage(this.error);

  //
  final String error;

  @override
  String getError(BuildContext context) {
    return error;
  }
}
