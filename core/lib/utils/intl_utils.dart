import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class IntlUtils {
  static dynamic toBeginningOfSentence(String text) {
    return toBeginningOfSentenceCase(text);
  }
}
