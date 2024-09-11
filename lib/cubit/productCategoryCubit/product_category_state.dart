part of 'product_category_cubit.dart';

@immutable
abstract class ProductCategoryState {}

class ProductCategoryInitial extends ProductCategoryState {}

class ProductCategoryLoading extends ProductCategoryState {}

class ProductCategorySuccess extends ProductCategoryState {
  List<ProductModel> productList = [];
  ProductCategorySuccess({required this.productList});
}

class ProductCategoryFailure extends ProductCategoryState {
  final String error;
  ProductCategoryFailure({required this.error});
}
