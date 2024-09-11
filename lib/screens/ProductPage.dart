import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/model/product_model.dart';

import '../cubit/updateProductCubit/update_product_cubit.dart';
import '../widget/CustomBotton.dart';
import '../widget/customField.dart';

class ProductPage extends StatefulWidget {
  final ProductModel proModel;
  const ProductPage({required this.proModel});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? productName, description, image;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  String? price;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocBuilder<UpdateProductCubit, UpdateProductState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Text(
                'Update Product ',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      customTextField(
                          valid: (p0) {
                            if (p0!.isEmpty) {
                              return 'Enter Product Name';
                            }
                            return null;
                          },
                          onCh: (p0) {
                            productName = p0;
                          },
                          hinName: 'ProductName',
                          fillColor: const Color.fromARGB(255, 207, 200, 200),
                          bordRadius: 20),
                      const SizedBox(
                        height: 15,
                      ),
                      customTextField(
                          valid: (p0) {
                            if (p0!.isEmpty) {
                              return 'Enter Product Description ';
                            }
                            return null;
                          },
                          onCh: (p0) {
                            description = p0;
                          },
                          hinName: 'Description',
                          fillColor: const Color.fromARGB(255, 207, 200, 200),
                          bordRadius: 20),
                      const SizedBox(
                        height: 15,
                      ),
                      customTextField(
                          valid: (p0) {
                            if (p0!.isEmpty) {
                              return 'Enter Product Price ';
                            }
                            return null;
                          },
                          onCh: (p0) {
                            price = p0;
                          },
                          textType: TextInputType.number,
                          hinName: 'Price',
                          fillColor: const Color.fromARGB(255, 207, 200, 200),
                          bordRadius: 20),
                      const SizedBox(
                        height: 15,
                      ),
                      customTextField(
                          valid: (p0) {
                            if (p0!.isEmpty) {
                              return 'Enter Product Image ';
                            }
                            return null;
                          },
                          onCh: (p0) {
                            image = p0;
                          },
                          hinName: 'Image',
                          fillColor: const Color.fromARGB(255, 207, 200, 200),
                          bordRadius: 20),
                      const SizedBox(
                        height: 40,
                      ),
                      bottom(
                          name: 'Update',
                          color: Colors.blue,
                          ontap: () async {
                            if (formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});

                              try {
                                BlocProvider.of<UpdateProductCubit>(context)
                                    .updateProduct(
                                        title: productName!,
                                        price: price!,
                                        description: description!,
                                        image: image!,
                                        id: widget.proModel.id,
                                        category: widget.proModel.category);
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(
                                          'The item has been updated successfully'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                print('Sucsse');
                              } catch (e) {
                                print(e.toString());
                                print('error');
                              }
                              isLoading = false;
                              setState(() {});
                            }
                          },
                          high: 50,
                          textcolor: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
