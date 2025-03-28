import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;

  SearchRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BooksModel>>> fetchSelectedCategory({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            '/volumes?q=subject:$category&Filtering=free-ebooks&orderBy=newest',
      );
      List<BooksModel> books = [];
      for (var items in data['items']) {
        books.add(BooksModel.fromJson(items));
      }
      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      } else {
        return Left(ServiceFailure(errorMessage: e.toString()));
      }
    }
  }
}
