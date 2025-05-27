import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/domain/entities/books_entity.dart';
import 'package:bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase)
    : super(NewestBooksCubitInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  void fetchNewestBooks({required String category}) async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call(category);

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
