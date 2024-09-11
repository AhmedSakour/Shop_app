import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/screens/productCategory_page.dart';

import '../cubit/categoryCubit/category_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> images = [
    'assest/images/electronic.jpg',
    'assest/images/jallewary.jpg',
    'assest/images/men.jpg',
    'assest/images/woman.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategorySuccess) {
            List<dynamic> category = state.category;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select the Gategory',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 15.0, // Spacing between columns
                        mainAxisSpacing: 20.0,
                        childAspectRatio: 1 / 1.8, // Spacing between rows
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductCategory(
                                      categoryName: category[index]),
                                ));
                          },
                          child: CategoryItem(
                            categoryName: category[index],
                            img: images[index],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          } else if (state is CategoryFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return Container();
          }
        },
      )),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.img,
    required this.categoryName,
  }) : super(key: key);
  final String img;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              categoryName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
