import '../core.dart';

extension DateFormatExtension on DateTime {
  String get dateFormattedString {
    return DateFormat("MMMM d '${LocaleKeys.time_at.tr()}' hh:mm a").format(this);
  }

  String get monthFormattedString {
    return DateFormat.MMMM().format(this);
  }
}
