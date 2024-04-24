import 'dart:io';
import 'package:mason/mason.dart';
import 'package:recase/recase.dart';

void run(HookContext context) async {
  context.logger.info(Directory.current.path);
  context.logger.info(context.vars.toString());

  final serviceName = context.vars['service_name'];

  final serviceNameSnakeCase = ReCase(serviceName).snakeCase;

  final dir = Directory.current.path +
      '/flutter_${serviceNameSnakeCase}_background_service';
  final packagesUrl = Directory.current.path +
      '/flutter_${serviceNameSnakeCase}_background_service/packages';

  final packagesDir = Directory.fromUri(Uri.parse(packagesUrl));

  const folders = [
    '.git',
    '.idea',
    '.vscode',
    '.dart_tool',
  ];

  folders.forEach((element) async {
    context.logger.info('removing $element');
    await Process.run(
      'rm',
      ['-r', '.$element'],
      workingDirectory: dir,
    );
  });

  await Process.run('flutter', ['clean'], workingDirectory: dir);
  await Future.delayed(Duration(seconds: 1));
  await Process.run(
    'melos',
    ['exec', '"flutter clean"'],
    workingDirectory: dir,
  );

  context.logger.info('Getting packages');
  await Process.run('flutter', ['pub', 'get'], workingDirectory: dir);

  context.logger.info(dir);
  await packagesDir.list().forEach((event) async {
    if (event is! Directory) return;
    context.logger.info(event.path);
    final result = await Process.run(
      'flutter',
      ['pub', 'get'],
      workingDirectory: event.path,
    );
    print(result.stdout);
  });

  // this command doesn't work
  /*
  context.logger.info('Melos getting all packages');
  await Process.run(
    'melos',
    ['exec', '"flutter pub get"'],
    workingDirectory: dir,
  );
  */
}
