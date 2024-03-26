import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    excludeBox: {
      Level.trace: true,
      Level.debug: true,
      Level.info: true,
      Level.warning: true,
      Level.error: true,
    },
  ),
);
