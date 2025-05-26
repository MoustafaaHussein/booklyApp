import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:hive/hive.dart';

void storingDataLocally(List<BooksEntity> books) {
  var box = Hive.box(kFeaturedBox);
  box.add(books);
}
