import 'package:args/command_runner.dart';

class FullCoverage extends Command<int> {
  @override
  String get name => 'full_coverage';

  @override
  String get description => 'A command that has full coverage';

  @override
  Future<int> run() async {
    print('This is a command that has full coverage');
    return 0;
  }
}
