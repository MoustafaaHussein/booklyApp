import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/books_model/books_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'serch_specific_category_state.dart';

class SerchSpecificCategoryCubit extends Cubit<SerchSpecificCategoryState> {
  SerchSpecificCategoryCubit(this.searchRepo)
    : super(SerchSpecificCategoryInitial());
  final SearchRepo searchRepo;
  void fetchSpecificCategory({required String category}) async {
    emit(SerchSpecificCategoryLoading());
    var result = await searchRepo.fetchSelectedCategory(category: category);

    result.fold(
      (failure) {
        return emit(SerchSpecificCategoryFailure(failure.errorMessage));
      },
      (books) {
        return emit(SerchSpecificCategorySuccess(books));
      },
    );
  }
}
