// Mocks generated by Mockito 5.4.4 from annotations
// in dart_test_tools/test/src/command_runner_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i7;

import 'package:args/command_runner.dart' as _i6;
import 'package:args/src/arg_parser.dart' as _i3;
import 'package:dart_test_tools/src/commands/full_coverage.dart' as _i4;
import 'package:dart_test_tools/src/util/path_util.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakePathUtil_0 extends _i1.SmartFake implements _i2.PathUtil {
  _FakePathUtil_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeArgParser_1 extends _i1.SmartFake implements _i3.ArgParser {
  _FakeArgParser_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FullCoverage].
///
/// See the documentation for Mockito's code generation for more information.
class MockFullCoverage extends _i1.Mock implements _i4.FullCoverage {
  @override
  _i2.PathUtil get pathUtil => (super.noSuchMethod(
        Invocation.getter(#pathUtil),
        returnValue: _FakePathUtil_0(
          this,
          Invocation.getter(#pathUtil),
        ),
        returnValueForMissingStub: _FakePathUtil_0(
          this,
          Invocation.getter(#pathUtil),
        ),
      ) as _i2.PathUtil);

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
      ) as String);

  @override
  String get description => (super.noSuchMethod(
        Invocation.getter(#description),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#description),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#description),
        ),
      ) as String);

  @override
  String get summary => (super.noSuchMethod(
        Invocation.getter(#summary),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#summary),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#summary),
        ),
      ) as String);

  @override
  String get category => (super.noSuchMethod(
        Invocation.getter(#category),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#category),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#category),
        ),
      ) as String);

  @override
  String get invocation => (super.noSuchMethod(
        Invocation.getter(#invocation),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#invocation),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#invocation),
        ),
      ) as String);

  @override
  _i3.ArgParser get argParser => (super.noSuchMethod(
        Invocation.getter(#argParser),
        returnValue: _FakeArgParser_1(
          this,
          Invocation.getter(#argParser),
        ),
        returnValueForMissingStub: _FakeArgParser_1(
          this,
          Invocation.getter(#argParser),
        ),
      ) as _i3.ArgParser);

  @override
  String get usage => (super.noSuchMethod(
        Invocation.getter(#usage),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#usage),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#usage),
        ),
      ) as String);

  @override
  Map<String, _i6.Command<int>> get subcommands => (super.noSuchMethod(
        Invocation.getter(#subcommands),
        returnValue: <String, _i6.Command<int>>{},
        returnValueForMissingStub: <String, _i6.Command<int>>{},
      ) as Map<String, _i6.Command<int>>);

  @override
  bool get hidden => (super.noSuchMethod(
        Invocation.getter(#hidden),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get takesArguments => (super.noSuchMethod(
        Invocation.getter(#takesArguments),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  List<String> get aliases => (super.noSuchMethod(
        Invocation.getter(#aliases),
        returnValue: <String>[],
        returnValueForMissingStub: <String>[],
      ) as List<String>);

  @override
  List<String> get suggestionAliases => (super.noSuchMethod(
        Invocation.getter(#suggestionAliases),
        returnValue: <String>[],
        returnValueForMissingStub: <String>[],
      ) as List<String>);

  @override
  _i7.Future<int> run() => (super.noSuchMethod(
        Invocation.method(
          #run,
          [],
        ),
        returnValue: _i7.Future<int>.value(0),
        returnValueForMissingStub: _i7.Future<int>.value(0),
      ) as _i7.Future<int>);

  @override
  String formatPathToImportSentence(
    String? path,
    String? packageName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #formatPathToImportSentence,
          [
            path,
            packageName,
          ],
        ),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #formatPathToImportSentence,
            [
              path,
              packageName,
            ],
          ),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.method(
            #formatPathToImportSentence,
            [
              path,
              packageName,
            ],
          ),
        ),
      ) as String);

  @override
  void writeCoverageTestFile(
    String? content,
    String? projectRootPath,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #writeCoverageTestFile,
          [
            content,
            projectRootPath,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addSubcommand(_i6.Command<int>? command) => super.noSuchMethod(
        Invocation.method(
          #addSubcommand,
          [command],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void printUsage() => super.noSuchMethod(
        Invocation.method(
          #printUsage,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  Never usageException(String? message) => (super.noSuchMethod(
        Invocation.method(
          #usageException,
          [message],
        ),
        returnValue: null,
        returnValueForMissingStub: null,
      ) as Never);
}