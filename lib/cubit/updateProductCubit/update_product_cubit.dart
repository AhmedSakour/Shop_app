import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meta/meta.dart';

import '../../helper/Api.dart';
import '../../model/product_model.dart';

part 'update_product_state.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateProductInitial());
  updateProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String id,
      required String category}) async {
    emit(UpdateProductLoading());
    try {
      Map<String, dynamic> data = await Api().put(
        url: '${dotenv.env['base_url']}/$id',
        body: {
          'id': id,
          'title': title,
          'price': price,
          'description': description,
          'image': image,
          'category': category,
        },
      );

      emit(UpdateProductSuccess());
      return ProductModel.fromjson(data);
    } on Exception catch (e) {
      emit(UpdateProductFailure(errorMessage: e.toString()));
    }
  }
}
