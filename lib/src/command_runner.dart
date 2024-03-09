import 'package:args/command_runner.dart';
import 'package:dart_test_tools/src/commands/full_coverage.dart';

const executableName = 'dart_test_tools';
const executableDescription = 'Dart test tools';

class DartTestToolsCommandRunner extends CommandRunner<int> {
  DartTestToolsCommandRunner() : super(executableName, executableDescription) {
    addCommand(FullCoverage());
  }
}
