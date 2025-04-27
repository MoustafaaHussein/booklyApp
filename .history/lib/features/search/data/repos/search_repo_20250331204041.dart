import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BooksModel>>> fetchSelectedCategory({
    required String searchBy,
    required String subject,
  });
}
