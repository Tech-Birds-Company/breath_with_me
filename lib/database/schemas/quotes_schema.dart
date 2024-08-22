import 'package:isar/isar.dart';

part 'quotes_schema.g.dart';

@collection
final class Quotes {
  Id? id;
  String language;
  String quote;
  String author;

  Quotes({
    required this.language,
    required this.quote,
    required this.author,
  });
}
