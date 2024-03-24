import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:dtt/src/util/path_util.dart';

class FullCoverage extends Command<int> {
  FullCoverage({PathUtil? pathUtil}) : pathUtil = pathUtil ?? PathUtil();
  final PathUtil pathUtil;
  @override
  String get name => 'full_coverage';

  @override
  String get description => 'A command that has full coverage';

  @override
  Future<int> run() async {
    final packageName = await pathUtil.getPackageName();
    if (packageName == null) {
      // dart project内にいない
      stderr.writeln(
          'You are not in a Dart project. Please make sure you are in a directory with a pubspec.yaml file or a subdirectory of such a directory.');
      return -1;
    }

    // TODO(miyasic): SourcePathを設定できるようにする
    final paths = await pathUtil.findSourcePaths();
    if (paths == null) {
      // Sourceのディレクトリが見つけられない。
      stderr.writeln(
          'Source directory not found. Ensure you have a "lib" directory in your Dart project and it contains your source files.');
      return -1;
    }
    final imports =
        paths.map((path) => formatPathToImportSentence(path, packageName));
    final coverageTestFile = pathUtil.readCoverageTestFile();
    if (coverageTestFile == null) {
      // coverage_test.dartが見つからない
      stderr.writeln(
          'Coverage test file not found. Ensure you have a "test/coverage_test.dart" file in your Dart project.');
      return -1;
    }
    final output = coverageTestFile.replaceFirst(
        'void main() {}', '${imports.join('\n')}\n\nvoid main() {}');

    final projectRoot = await pathUtil.findDartProjectRoot();
    if (projectRoot == null) {
      // dart project内にいない
      stderr.writeln('you are not in a dart project.');
      return -1;
    }
    writeCoverageTestFile(output, projectRoot.path);
    return 0;
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
