import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';

import '../../helper/Api.dart';
import '../../model/product_model.dart';

part 'product_category_state.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  ProductCategoryCubit() : super(ProductCategoryInitial());
  List<ProductModel> productList = [];
  getAllProductCategory({required String categoreyName}) async {
    emit(ProductCategoryLoading());
    try {
      List<dynamic>? data = await Api()
          .get(url: '${dotenv.env['base_url']}/category/$categoreyName');

      if (data != null) {
        for (int i = 0; i < data.length; i++) {
          productList.add(ProductModel.fromjson(data[i]));
        }
        emit(ProductCategorySuccess(productList: productList));
      } else {
        emit(ProductCategoryFailure(error: 'no data found'));
      }
    } on Exception catch (e) {
      emit(ProductCategoryFailure(error: e.toString()));
    }
  }
}
