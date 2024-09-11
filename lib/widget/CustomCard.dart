import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';

import '../screens/ProductPage.dart';

class CustomCard extends StatelessWidget {
  ProductModel productModel;
  CustomCard({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductPage(
                proModel: productModel,
              ),
            ));
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              offset: const Offset(10, 10),
              blurRadius: 50,
              spreadRadius: 0,
            ),
          ]),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    productModel.title.substring(0, 7),
                    style: const TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${productModel.price.toString()}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 100,
          bottom: 60,
          child: Image.network(
            productModel.image,
            width: 50,
            height: 50,
          ),
        )
      ]),
    );
  }
}
