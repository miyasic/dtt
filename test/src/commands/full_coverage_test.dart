import 'dart:io';

import 'package:dtt/src/commands/full_coverage.dart';
import 'package:dtt/src/util/path_util.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'full_coverage_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PathUtil>()])
void main() {
  group('FullCoverage Command Tests', () {
    late FullCoverage command;
    late MockPathUtil mockPathUtil;

    setUp(() {
      mockPathUtil = MockPathUtil();
      command = FullCoverage(pathUtil: mockPathUtil);
    });

    test('run returns 0 when everything is fine', () async {
      when(mockPathUtil.getPackageName()).thenAnswer((_) async => 'dtt');
      when(mockPathUtil.findSourcePaths()).thenAnswer((_) async => [
            'dtt.dart',
            'src/util/path_util.dart',
            'src/commands/full_coverage.dart',
            'src/command_runner.dart',
          ]);
      when(mockPathUtil.readCoverageTestFile())
          .thenAnswer((_) => 'void main() {}');
      when(mockPathUtil.findDartProjectRoot())
          .thenAnswer((_) async => Directory.current);

      // 実際にテストを実行
      final result = await command.run();

      expect(result, equals(0));
      verify(mockPathUtil.getPackageName()).called(1);
      verify(mockPathUtil.findSourcePaths()).called(1);
      verify(mockPathUtil.readCoverageTestFile()).called(1);
      verify(mockPathUtil.findDartProjectRoot()).called(1);
    });

    test('run returns -1 when getPackageName returns null', () async {
      when(mockPathUtil.getPackageName()).thenAnswer((_) async => null);

      final result = await command.run();

      expect(result, equals(-1));
      verify(mockPathUtil.getPackageName()).called(1);
      verifyNever(mockPathUtil.findSourcePaths());
      verifyNever(mockPathUtil.readCoverageTestFile());
      verifyNever(mockPathUtil.findDartProjectRoot());
    });

    test('run returns -1 when findSourcePaths returns null', () async {
      when(mockPathUtil.getPackageName()).thenAnswer((_) async => 'dtt');
      when(mockPathUtil.findSourcePaths()).thenAnswer((_) async => null);

      final result = await command.run();

      expect(result, equals(-1));
      verify(mockPathUtil.getPackageName()).called(1);
      verify(mockPathUtil.findSourcePaths()).called(1);
      verifyNever(mockPathUtil.readCoverageTestFile());
      verifyNever(mockPathUtil.findDartProjectRoot());
    });

    test('run returns -1 when coverageTestFile returns null', () async {
      when(mockPathUtil.getPackageName()).thenAnswer((_) async => 'dtt');
      when(mockPathUtil.findSourcePaths()).thenAnswer((_) async => [
            'dtt.dart',
            'src/util/path_util.dart',
            'src/commands/full_coverage.dart',
            'src/command_runner.dart',
          ]);
      when(mockPathUtil.readCoverageTestFile()).thenAnswer((_) => null);
      when(mockPathUtil.findDartProjectRoot())
          .thenAnswer((_) async => Directory.current);
      when(mockPathUtil.readCoverageTestFile()).thenAnswer((_) => null);

      final result = await command.run();

      expect(result, equals(-1));
      verify(mockPathUtil.getPackageName()).called(1);
      verify(mockPathUtil.findSourcePaths()).called(1);
      verify(mockPathUtil.readCoverageTestFile()).called(1);
      verifyNever(mockPathUtil.findDartProjectRoot());
    });

    test('run returns -1 when findDartProjectRoot returns null', () async {
      when(mockPathUtil.getPackageName()).thenAnswer((_) async => 'dtt');
      when(mockPathUtil.findSourcePaths()).thenAnswer((_) async => [
            'dtt.dart',
            'src/util/path_util.dart',
            'src/commands/full_coverage.dart',
            'src/command_runner.dart',
          ]);
      when(mockPathUtil.readCoverageTestFile())
          .thenAnswer((_) => 'void main() {}');
      when(mockPathUtil.findDartProjectRoot()).thenAnswer((_) async => null);

      final result = await command.run();

      expect(result, equals(-1));
      verify(mockPathUtil.getPackageName()).called(1);
      verify(mockPathUtil.findSourcePaths()).called(1);
      verify(mockPathUtil.readCoverageTestFile()).called(1);
      verify(mockPathUtil.findDartProjectRoot()).called(1);
    });
  });
}
