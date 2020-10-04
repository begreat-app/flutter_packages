import '../utils/string_utils.dart';
import 'validator.dart';

///
class EmailValidator extends Validator {
  EmailValidator([String initialError]) : super(initialError);

  @override
  Future<bool> validate(String text) async {
    return StringUtils.isEmail(text);
  }
}
