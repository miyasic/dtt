## dart_test_tools(dtt)

A CLI tool for dart projects to enhance convenience in automated testing.

## Features

- full_coverage: Generate a coverage_test.dart file that imports all Dart files in the lib directory.

## Getting started
To install Dart Test Tools, use the following command:

```
dart pub global activate dtt
```
This command makes dtt globally available on your system, assuming your Dart environment is correctly set up.

## Usage
To generate a coverage_test.dart file that ensures full coverage by importing all Dart files in the lib directory, run:

```dart
dtt full_coverage
```

**Note**: Attempting to use dtt outside of a Dart project directory structure (where no pubspec.yaml can be found in any parent directory) will result in failure. Ensure you are within a Dart project directory or its subdirectories when executing dtt commands.

## Additional information

We welcome a variety of feature requests through GitHub issues.