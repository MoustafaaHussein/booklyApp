import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImplementation({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BooksEntity>>> fetchNewestBooks({
    required String category,
  }) async {
    try {
      List<BooksEntity> books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }

      books = await homeRemoteDataSource.fetchNewestBooks(category: category);
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServiceFailure.fromDioError(e));
      } else {
        return Left(ServiceFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  // This method fetches featured books from the remote data source and saves them to the local data source.
  Future<Either<Failure, List<BooksEntity>>> fetchFeaturedBooks({
    int pageNumber = 0,
    required String category,
  }) async {
    try {
      // First, try to fetch featured books from the local data source
      // If the local data source has books, return them
      List<BooksEntity> books = homeLocalDataSource.fetchFeaturedBooks(
        category,
      );
      if (books.isNotEmpty) {
        return right(books);
      }
      // If the local data source is empty, fetch books from the remote data source
      // and save them to the local data source
      books = await homeRemoteDataSource.fetchFeaturedBooks(category: category);
      return right(books);
    } catch (e) {
      // Handle exceptions and return a Failure
      // If the exception is a DioException, convert it to a ServiceFailure
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      } else {
        return Left(ServiceFailure(errorMessage: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BooksEntity>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      List<BooksEntity> books = homeLocalDataSource.fetchSimilarBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchSimilarBooks(category: category);
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
