///
/// Validator
abstract class Validator {
  //
  const Validator(this.error);

  ///
  final String error;

  //
  Future<bool> validate(String text);
}
