import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:hive/hive.dart';

// void saveBooksToLocalStorage(List<BooksEntity> books, String boxName) {
//   var box = Hive.box<BooksEntity>(boxName);
//   box.addAll(books);
// }

void saveBooksToLocalStorages(
  List<BooksEntity> books,
  String boxName,
  String category,
) {
  final box = Hive.box<BooksEntity>(boxName);
  for (var book in books) {
    box.add(book); // appends each book
  }
}
