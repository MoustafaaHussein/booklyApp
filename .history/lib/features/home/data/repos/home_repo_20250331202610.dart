import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BooksModel>>> fetchNewestBooks({
    required String parameter,
  });
  Future<Either<Failure, List<BooksModel>>> fetchFeaturedBooks({
    required String category,
  });
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks({
    required String category,
  });
}
