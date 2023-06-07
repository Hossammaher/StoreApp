import 'package:store_app/Model/product_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/Api.dart';

class GetAllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    http.Response response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));
    List<dynamic> data =
        await Api().get(Url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
