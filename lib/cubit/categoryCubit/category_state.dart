part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  List<dynamic> category;
  CategorySuccess({required this.category});
}

class CategoryFailure extends CategoryState {
  final String errorMessage;
  CategoryFailure({required this.errorMessage});
}
