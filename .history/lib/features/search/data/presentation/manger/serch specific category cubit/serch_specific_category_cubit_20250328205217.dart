import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'serch_specific_category_state.dart';

class SerchSpecificCategoryCubit extends Cubit<SerchSpecificCategoryState> {
  SerchSpecificCategoryCubit() : super(SerchSpecificCategoryInitial());
}
