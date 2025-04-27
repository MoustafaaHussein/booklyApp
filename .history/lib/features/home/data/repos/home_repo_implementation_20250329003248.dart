import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BooksModel>>> fetchNewestBooks({
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
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      } else if (e is TypeError) {
        return left(
          ServiceFailure(
            errorMessage: 'there was an error please try again later',
          ),
        );
      } else {
        return Left(ServiceFailure.fromResponse(303, e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: '/volumes?q=subject:$category&Filtering=free-ebooks',
      );
      List<BooksModel> books = [];
      for (var items in data['items']) {
        books.add(BooksModel.fromJson(items));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      } else if (e is TypeError) {
        return left(
          ServiceFailure(
            errorMessage: 'there was an error please try again later',
          ),
        );
      } else {
        return Left(ServiceFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: '/volumes?q=subject:$category&Filtering=free-ebooks',
      );
      List<BooksModel> books = [];
      for (var items in data['items']) {
        books.add(BooksModel.fromJson(items));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      } else {
        return Left(ServiceFailure(errorMessage: e.toString()));
      }
    }
  }
}
