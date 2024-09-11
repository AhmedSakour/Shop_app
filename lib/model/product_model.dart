class ProductModel {
  final String id;
  final String title;
  final String description;
  final String price;
  final String category;
  final String image;
  // final RatingProduct ratingProduct;
  ProductModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
    //  required this.ratingProduct,
  });
  factory ProductModel.fromjson(JsonData) {
    return ProductModel(
      category: JsonData['category'],
      description: JsonData['description'],
      id: JsonData['id'].toString(),
      image: JsonData['image'],
      price: JsonData['price'].toString(),
      title: JsonData['title'],
      //  ratingProduct: RatingProduct.fromjson(JsonData['rating']),
    );
  }
}

// class RatingProduct {
//   int count;
//   var rate;
//   RatingProduct({required this.count, required this.rate});
//   factory RatingProduct.fromjson(JsonData) {
//     return RatingProduct(
//       count: JsonData['count'],
//       rate: JsonData['rate'],
//     );
//   }
// }
