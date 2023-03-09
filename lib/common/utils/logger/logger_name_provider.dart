abstract class LoggerNameGetter {
  String get loggerName => '$runtimeType #${identityHashCode(this)}';
}
