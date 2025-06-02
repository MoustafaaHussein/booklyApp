import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BooksEntity> fetchFeaturedBooks([String category]);
  List<BooksEntity> fetchNewestBooks();
  List<BooksEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
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

  @override
  List<BooksEntity> fetchFeaturedBooks([String? category, int pageNumber = 0]) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BooksEntity>(kFeaturedBox);
    if (startIndex > box.values.length || endIndex > box.values.length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
