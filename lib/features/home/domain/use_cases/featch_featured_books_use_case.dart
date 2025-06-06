import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/features/home/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase
    extends UseCase<List<BooksEntity>, String, int> {
  final HomeRepo homeRepo;
  // This use case is responsible for fetching featured books from the repository this following clean architecture principles
  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BooksEntity>>> call([
    String? category,
    int pageNumber = 0,
    bool forceRefresh = false,
  ]) async {
    return await homeRepo.fetchFeaturedBooks(
      category: category!,
      pageNumber: pageNumber,
      forceRefresh: forceRefresh,
    );
  }
}

class NoParameter {}
