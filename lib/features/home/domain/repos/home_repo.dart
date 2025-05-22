import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    required String category,
  });
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    required String category,
  });
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
  });
}
