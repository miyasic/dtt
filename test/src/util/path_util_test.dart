import 'dart:io';

import 'package:dart_test_tools/src/util/path_util.dart';
import 'package:test/test.dart';

void main() {
  final pathUtil = PathUtil();
  group('PathUtil Tests', () {
    test(
        'findDartProjectRoot should return the root path of the project in current directory',
        () async {
      expect(await pathUtil.findDartProjectRoot(), isNotNull);
    });

    test(
        'findDartProjectRoot should return the root path of the project in source directory',
        () async {
      final executionDirectory = Directory('lib/src');
      expect(await pathUtil.findDartProjectRoot(dir: executionDirectory),
          isNotNull);
    });

    test(
        'findDartProjectRoot should not return the root path of the project in home directory',
        () async {
      final executionDirectory = Directory.systemTemp.createTempSync();
      expect(
          await pathUtil.findDartProjectRoot(dir: executionDirectory), isNull);
      executionDirectory.deleteSync(recursive: true);
    });

    test('getPackageName should return the package name from pubspec.yaml',
        () async {
      expect(await pathUtil.getPackageName(), 'dart_test_tools');
    });

    test('read coverage_test.dart file success', () {
      expect(pathUtil.readCoverageTestFile(), isNotNull);
    });

    test('read coverage_test.dart file failure', () {
      expect(
          pathUtil.readCoverageTestFile(
              assetPath: 'asset/dart/coverage_test_fake.dart'),
          isNull);
    });

    test('findSourcePaths should return paths within the specified directory',
        () async {
      var srcPaths = await pathUtil.findSourcePaths();
      expect(srcPaths, isNotNull);
      expect(srcPaths!.isNotEmpty, isTrue);
    });
  });
}
