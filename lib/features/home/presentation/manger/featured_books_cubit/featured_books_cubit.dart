import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  void fetchFeaturedBooks({required String category}) async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks(category: category);

    result.fold((failure) => emit(FeaturedBooksFailure(failure.errorMessage)), (
      books,
    ) {
      return emit(FeaturedBooksSuccess(books));
    });
  }
}
