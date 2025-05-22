import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/features/home/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, String> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([String? category]) async {
    return await homeRepo.fetchFeaturedBooks(category: category!);
  }
}

class NoParameter {}
