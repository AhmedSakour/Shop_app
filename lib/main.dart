import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:store_app/cubit/updateProductCubit/update_product_cubit.dart';

import 'package:store_app/screens/HomePage.dart';

import 'cubit/categoryCubit/category_cubit.dart';
import 'cubit/productCategoryCubit/product_category_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit()..getAllCategories(),
        ),
        BlocProvider(
          create: (context) => ProductCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateProductCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
