import 'dart:io';

bool hasArgument(String key, List<String> args) {
  return args.contains(key);
}

void main(List<String> args) async {
  var version = '';
  var build = '';
  var env = 'prod';
  var target = 'lib/main_prod.dart';

  final infoPlistPath = '../ios/config/$env/GoogleService-Info.plist';
  const dSYMsPath = '../build/ios/archive/Runner.xcarchive/dSYMs';

  if (hasArgument('--version', args)) {
    version = args[args.indexOf('--version') + 1];
  }

  if (hasArgument('--build', args)) {
    build = args[args.indexOf('--build') + 1];
  }

  if (hasArgument('--env', args)) {
    env = args[args.indexOf('--env') + 1];
  }

  if (version.isEmpty || build.isEmpty) {
    print(
      'Error: Missing required arguments: --version and --build are mandatory.',
    );
    exit(1);
  }

  if (env == 'dev') {
    target = 'lib/main_dev.dart';
  }

  print('Cleaning Flutter project...');
  await Process.run('rm', ['-rf', 'build']);
  await Process.run('fvm', ['flutter', 'clean']);

  print('Running flutter pub get...');
  await Process.run('fvm', ['flutter', 'pub', 'get']);

  print('Building Flutter IPA $version ($build) $env ...');
  await Process.run(
    'fvm',
    [
      'flutter',
      'build',
      'ipa',
      '--build-name=$version',
      '--build-number=$build',
      '--obfuscate',
      '--split-debug-info',
      'build/ios/symbols',
      '--flavor=$env',
      '--target=$target',
    ],
  );
  print('Uploading dSYMs to Firebase...');
  final result = await Process.run(
    '../ios/Pods/FirebaseCrashlytics/upload-symbols',
    [
      '-gsp',
      infoPlistPath,
      '-p',
      'ios',
      dSYMsPath,
    ],
  );
  print(result.stdout);

  print('Build finished!');
}
