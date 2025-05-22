import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchNewestBooks({required String category});
  Future<List<BookEntity>> fetchFeaturedBooks({required String category});
  Future<List<BookEntity>> fetchSimilarBooks({required String category});
}

// data source is resposible for getting the data only so we didn't used either class
class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({
    required String category,
  }) async {
    var data = await apiService.get(
      endPoint: '/volumes?q=title:$category&Filtering=free-ebooks',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BooksModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({required String category}) async {
    var data = await apiService.get(
      endPoint: '/volumes?q=title:$category&Filtering=free-ebooks',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({required String category}) async {
    var data = await apiService.get(
      endPoint: '/volumes?q=subject:$category&Filtering=free-ebooks',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}
