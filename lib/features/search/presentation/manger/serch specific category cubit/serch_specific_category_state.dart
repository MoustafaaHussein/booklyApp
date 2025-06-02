part of 'serch_specific_category_cubit.dart';

sealed class SerchSpecificCategoryState extends Equatable {
  const SerchSpecificCategoryState();

  @override
  List<Object> get props => [];
}

final class SerchSpecificCategoryInitial extends SerchSpecificCategoryState {}

final class SerchSpecificCategorySubmitted extends SerchSpecificCategoryState {
  final List<BooksModel> books;

  const SerchSpecificCategorySubmitted(this.books);
}

final class SerchSpecificCategoryFailure extends SerchSpecificCategoryState {
  final String errorMessage;

  const SerchSpecificCategoryFailure(this.errorMessage);
}
