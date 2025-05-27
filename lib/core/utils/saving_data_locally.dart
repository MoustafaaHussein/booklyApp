import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:hive/hive.dart';

void saveBooksToLocalStorage(List<BooksEntity> books, String boxName) {
  var box = Hive.box(boxName);
  box.add(books);
}
