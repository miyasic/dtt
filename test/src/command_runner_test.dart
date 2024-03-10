import 'package:dart_test_tools/src/command_runner.dart';
import 'package:test/test.dart';

void main() {
  group('DartTestToolsCommandRunner Tests', () {
    late DartTestToolsCommandRunner runner;

    setUp(() {
      runner = DartTestToolsCommandRunner();
    });

    test('should contain FullCoverage command', () {
      expect(runner.commands.keys, contains('full_coverage'));
    });

    test('FullCoverage command should run successfully', () async {
      final result = await runner.run(['full_coverage']);
      expect(result, equals(0));
    });

    test('run with empty argments', () async {
      final result = await runner.run([]);
      expect(result, equals(null));
    });
  });
}
