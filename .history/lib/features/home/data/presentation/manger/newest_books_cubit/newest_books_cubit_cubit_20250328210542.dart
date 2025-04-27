import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksCubitInitial());

  final HomeRepo homeRepo;

  void fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();

    result.fold(
      (failure) {
        return emit(NewestBooksFailure(failure.errorMessage));
      },
      (books) {
        return emit(NewestBooksSuccess(books));
      },
    );
  }
}
