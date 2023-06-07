import 'package:flutter/material.dart';
import 'package:store_app/Model/product_model.dart';
import 'package:store_app/Service/update_product.dart';
import 'package:store_app/widgets/CustomButton.dart';
import 'package:store_app/widgets/CustomTextField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({Key? key}) : super(key: key);

  static String id = "UpdatePage";

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  String? title;

  var price;

  String? description;

  String? image;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CustomTextField(
              labelText: "Title",

              onchange: (data) {
                title = data;

              },
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: "Price",
              inputType: TextInputType.number,

              onchange: (data) {
                price = data;
              },
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              inputType: TextInputType.multiline,
              labelText: "description",

              onchange: (data) {
                description = data;
              },
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              labelText: "Image",

              onchange: (data) {
                image = data;
              },
            ),
            SizedBox(
              height: 30,
            ),
            CustomButton(
              buttonName: "Update",
              onTap: () {
                isLoading = true;
                setState(() {});

                try {
                  UpdateProduct(productModel);
                  showSnakeBar(context, "Update done ");

                } on Exception catch (e) {

                }

                isLoading = false;
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }

  void UpdateProduct(ProductModel productModel) {
    update_product().updateProduct(
        id:productModel.id ,
        title: title == null ? productModel.title : title!,
        price: productModel.price.toString(),
        description: description == null ? productModel.description : description!,
        image: productModel.image,
        category: productModel.category);
  }
  void showSnakeBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
