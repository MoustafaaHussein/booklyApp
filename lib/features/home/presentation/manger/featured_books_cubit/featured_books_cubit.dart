import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/featch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  // This cubit is responsible for managing the state of featured books
  // It fetches featured books from the use case and emits the appropriate states
  Future<void> fetchFeaturedBooks({
    required String category,
    int pageNumber = 0,
    bool forceRefresh = false,
  }) async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call(
      category,
      pageNumber,
      forceRefresh,
    );

    result.fold((failure) => emit(FeaturedBooksFailure(failure.errorMessage)), (
      books,
    ) {
      return emit(FeaturedBooksSuccess(books));
    });
  }
}
