import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/Api.dart';
import '../Model/product_model.dart';

class CategoriesServices {
  Future<List> getCategoriesServices({required String category_name}) async {
    List<dynamic> data = await Api()
        .get(Url: 'https://fakestoreapi.com/products/category/$category_name');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductModel.fromJson(data[i]));
    }
    return productList;
  }
}
