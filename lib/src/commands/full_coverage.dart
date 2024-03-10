import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dart_test_tools/src/util/path_util.dart';

class FullCoverage extends Command<int> {
  @override
  String get name => 'full_coverage';

  @override
  String get description => 'A command that has full coverage';

  @override
  Future<int> run() async {
    final packageName = await PathUtil.getPackageName();
    if (packageName == null) {
      return -1;
    }
    final paths = await PathUtil.findSourcePaths();
    if (paths == null) {
      return -1;
    }
    final imports =
        paths.map((path) => formatPathToImportSentence(path, packageName));
    final coverageTestFile = readCoverageTestFile();
    if (coverageTestFile == null) {
      return -1;
    }
    final output = coverageTestFile.replaceFirst(
        'void main() {}', '${imports.join('\n')}\n\nvoid main() {}');

    final projectRoot = await PathUtil.findDartProjectRoot();
    if (projectRoot == null) {
      return -1;
    }
    writeCoverageTestFile(output, projectRoot.path);
    return 0;
  }

  String? readCoverageTestFile() {
    final coverageTestFile = File('asset/dart/coverage_test.dart');
    if (coverageTestFile.existsSync()) {
      return coverageTestFile.readAsStringSync();
    } else {
      return null;
    }
  }

  String formatPathToImportSentence(String path, String packageName) {
    return "import 'package:$packageName/$path';";
  }

  // ファイル出力
  void writeCoverageTestFile(String content, String projectRootPath) {
    final coverageTestFile = File('$projectRootPath/test/coverage_test.dart');
    coverageTestFile.writeAsStringSync(content);
  }
}
