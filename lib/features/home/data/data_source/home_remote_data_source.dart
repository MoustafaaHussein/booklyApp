import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BooksEntity>> fetchNewestBooks({required String category});
  Future<List<BooksEntity>> fetchFeaturedBooks({required String category});
  Future<List<BooksEntity>> fetchSimilarBooks({required String category});
}

// data source is resposible for getting the data only so we didn't used either class
class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation(this.apiService);
  @override
  Future<List<BooksEntity>> fetchFeaturedBooks({
    required String category,
  }) async {
    var data = await apiService.get(
      endPoint: '/volumes?q=title:$category&Filtering=free-ebooks',
    );
    List<BooksEntity> books = getBooksList(data);
    return books;
  }

  List<BooksEntity> getBooksList(Map<String, dynamic> data) {
    List<BooksEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BooksModel.fromJson(bookMap));
    }
    return books;
  }

  @override
  Future<List<BooksEntity>> fetchNewestBooks({required String category}) async {
    var data = await apiService.get(
      endPoint: '/volumes?q=title:$category&Filtering=free-ebooks',
    );
    List<BooksEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BooksEntity>> fetchSimilarBooks({
    required String category,
  }) async {
    var data = await apiService.get(
      endPoint: '/volumes?q=subject:$category&Filtering=free-ebooks',
    );
    List<BooksEntity> books = getBooksList(data);
    return books;
  }
}
