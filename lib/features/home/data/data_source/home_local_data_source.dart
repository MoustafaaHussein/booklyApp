import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BooksEntity> fetchFeaturedBooks();
  List<BooksEntity> fetchNewestBooks();
  List<BooksEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BooksEntity> fetchFeaturedBooks() {
    var box = Hive.box<BooksEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BooksEntity> fetchNewestBooks() {
    var box = Hive.box<BooksEntity>(kNewestBox);
    return box.values.toList();
  }

  @override
  List<BooksEntity> fetchSimilarBooks() {
    var box = Hive.box<BooksEntity>(kSimilarBox);
    return box.values.toList();
  }
}
