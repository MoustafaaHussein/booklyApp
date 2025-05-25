import 'package:bookly_app/features/home/domain/entities/books_entity.dart';

abstract class HomeLocalDataSource {
  List<BooksEntity> fetchFeaturedBooks();
  List<BooksEntity> fetchNewestBooks();
  List<BooksEntity> fetchSimilarBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BooksEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BooksEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  List<BooksEntity> fetchSimilarBooks() {
    // TODO: implement fetchSimilarBooks
    throw UnimplementedError();
  }
}
