part of 'bag.dart';

class Strings {
  Strings._();
  late final general = _GeneralStrings();
  late final errors = _ErrorStrings();
  late final ids = _IdStrings();
}

class _GeneralStrings {}

class _ErrorStrings {
  final String somethingWentWrong = 'Something went wrong';
}

class _IdStrings {
  final String appName = 'Flutter App';
}
