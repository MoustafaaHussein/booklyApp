import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksCubitInitial());

  final HomeRepo homeRepo;

  void fetchNewestBooks({required String category}) async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks(category: category);

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
