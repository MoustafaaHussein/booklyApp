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
      var cachedbooks = homeLocalDataSource.fetchNewestBooks();
      if (cachedbooks.isNotEmpty) {
        return right(cachedbooks);
      }

      var books = await homeRemoteDataSource.fetchNewestBooks(
        category: category,
      );
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
  Future<Either<Failure, List<BooksEntity>>> fetchFeaturedBooks({
    required String category,
  }) async {
    try {
      var cachedbooks = homeLocalDataSource.fetchFeaturedBooks();
      if (cachedbooks.isNotEmpty) {
        return right(cachedbooks);
      }

      var books = await homeRemoteDataSource.fetchFeaturedBooks(
        category: category,
      );
      return right(books);
    } catch (e) {
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
      var cachedbooks = homeLocalDataSource.fetchSimilarBooks();
      if (cachedbooks.isNotEmpty) {
        return right(cachedbooks);
      }
      var books = await homeRemoteDataSource.fetchSimilarBooks(
        category: category,
      );
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
