import 'dart:io';

final currentDirectory = Directory.current;

class PathUtil {
  static Future<Directory?> findDartProjectRoot({Directory? dir}) async {
    dir ??= currentDirectory;
    var pubspecFile = File('${dir.path}/pubspec.yaml');
    if (await pubspecFile.exists()) {
      return dir;
    } else {
      if (dir.parent.path == dir.path) {
        return null;
      }
      return findDartProjectRoot(dir: dir.parent);
    }
  }

  static Future<String?> getPackageName() async {
    final projectRoot = await findDartProjectRoot();
    if (projectRoot == null) {
      return null;
    }
    final pubspecContent =
        await File('${projectRoot.path}/pubspec.yaml').readAsString();
    final packageName =
        RegExp(r'name: (.+)').firstMatch(pubspecContent)?.group(1);
    return packageName;
  }

  static Future<List<String>?> findSourcePaths({String? sourceDirPath}) async {
    final projectRoot = await findDartProjectRoot();
    if (projectRoot == null) {
      return null;
    }
    final srcDir = Directory('${projectRoot.path}/${sourceDirPath ?? 'lib'}');
    final srcPaths = <String>[];
    await for (var entity in srcDir.list(recursive: true)) {
      if (entity is File) {
        srcPaths.add(entity.path.replaceFirst('${srcDir.path}/', ''));
      }
    }
    return srcPaths;
  }
}
