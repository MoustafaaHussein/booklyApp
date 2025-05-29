import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BooksEntity>>> fetchNewestBooks({
    required String category,
  });
  Future<Either<Failure, List<BooksEntity>>> fetchFeaturedBooks({
    required String category,
    int pageNumber = 0,
  });
  Future<Either<Failure, List<BooksEntity>>> fetchSimilarBooks({
    required String category,
  });
}
