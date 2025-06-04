import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/saving_data_locally.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BooksEntity>> fetchNewestBooks({
    required String category,
    int pageNumber = 0,
  });
  Future<List<BooksEntity>> fetchFeaturedBooks({
    required String category,
    int pageNumber = 0,
  });
  Future<List<BooksEntity>> fetchSimilarBooks({required String category});
}

// data source is resposible for getting the data only so we didn't used either class
class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImplementation({required this.apiService});
  @override
  Future<List<BooksEntity>> fetchFeaturedBooks({
    int pageNumber = 0,
    required String category,
  }) async {
    var data = await apiService.get(
      endPoint:
          '/volumes?q=title:$category&Filtering=free-ebooks&startIndex=${pageNumber * 10}', // page number for pagination as the API returns 10 items per page
      // you can also use pageNumber * 10 to get the next 10 items
    );
    List<BooksEntity> books = getBooksList(data);
    saveBooksToLocalStorages(books, kFeaturedBox, category);
    return books;
  }

  List<BooksEntity> getBooksList(Map<String, dynamic> data) {
    List<BooksEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BooksModel.fromJson(bookMap));
    }
    return books;
    // This method converts the JSON data into a list of BooksEntity objects
  }

  @override
  Future<List<BooksEntity>> fetchNewestBooks({
    required String category,
    int pageNumber = 0,
  }) async {
    var data = await apiService.get(
      endPoint:
          '/volumes?q=title:$category&Filtering=free-ebooks&startIndex=${pageNumber * 10}',
    );
    List<BooksEntity> books = getBooksList(data);
    saveBooksToLocalStorages(books, kNewestBox, category);
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
    saveBooksToLocalStorages(books, kSimilarBox, category);
    return books;
  }
}
