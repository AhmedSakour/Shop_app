import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/model/product_model.dart';

import '../cubit/productCategoryCubit/product_category_cubit.dart';
import '../widget/CustomCard.dart';

class ProductCategory extends StatefulWidget {
  const ProductCategory({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  @override
  void initState() {
    BlocProvider.of<ProductCategoryCubit>(context).productList = [];
    BlocProvider.of<ProductCategoryCubit>(context)
        .getAllProductCategory(categoreyName: widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
          builder: (context, state) {
        if (state is ProductCategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductCategorySuccess) {
          List<ProductModel> category = state.productList;
          return Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 10, left: 20, right: 20),
            child: GridView.builder(
              itemCount: category.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  productModel: category[index],
                );
              },
            ),
          );
        } else if (state is ProductCategoryFailure) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
