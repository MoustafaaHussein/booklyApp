import 'package:hive/hive.dart';

part 'books_entity.g.dart';

@HiveType(typeId: 0)
class BooksEntity {
  @HiveField(0)
  final String author;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String ratting;
  @HiveField(4)
  BooksEntity({
    required this.author,
    required this.title,
    required this.image,
    required this.ratting,
  });
}
