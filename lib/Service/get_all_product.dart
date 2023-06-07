import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/helper/Api.dart';

import '../Model/product_model.dart';

class get_all_product {
  Future<List<ProductModel>> getAllProduct() async {

    List<dynamic> data = await Api().get(Url: 'https://fakestoreapi.com/products') ;

      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromJson(data[i]));
        print("okkkkkk");
      }
    print(productList);

      return productList;

  }
}
