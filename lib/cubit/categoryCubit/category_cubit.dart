import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';

import '../../helper/Api.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List<dynamic>? data;
  getAllCategories() async {
    emit(CategoryLoading());
    try {
      data = await Api().get(url: '${dotenv.env['base_url']}/categories');
      if (data != null) {
        emit(CategorySuccess(category: data!));
      } else {
        emit(CategoryFailure(errorMessage: 'no data'));
      }
    } on Exception catch (e) {
      emit(CategoryFailure(errorMessage: e.toString()));
      // TODO
    }
  }
}
