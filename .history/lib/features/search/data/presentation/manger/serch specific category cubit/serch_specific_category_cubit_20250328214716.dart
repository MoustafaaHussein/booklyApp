import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'serch_specific_category_state.dart';

class SerchSpecificCategoryCubit extends Cubit<SerchSpecificCategoryState> {
  SerchSpecificCategoryCubit(this.searchRepo)
    : super(SerchSpecificCategoryInitial());
  final SearchRepo searchRepo;
  void fetchSpecificCategory({required String category}) async {
    var result = await searchRepo.fetchSelectedCategory(category: category);

    result.fold(
      (failure) {
        return emit(SerchSpecificCategoryFailure(failure.errorMessage));
      },
      (category) {
        return emit(SerchSpecificCategorySubmitted(category: category));
      },
    );
  }
}
