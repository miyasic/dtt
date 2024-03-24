import 'package:args/command_runner.dart';
import 'package:dtt/src/commands/full_coverage.dart';

const executableName = 'dtt';
const executableDescription = 'Dart test tools';

class DartTestToolsCommandRunner extends CommandRunner<int> {
  DartTestToolsCommandRunner() : super(executableName, executableDescription) {
    addCommand(FullCoverage());
  }
}
