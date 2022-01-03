import 'package:simple_logger/simple_logger.dart';
import 'package:stack_trace/stack_trace.dart';

final logger = SimpleLogger();

void logFunctionName() {
  final funName = Trace.current().frames[0].member;
  if (funName != null) logger.info(funName);
}
