import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Model/product_model.dart';
import 'package:store_app/Service/get_all_product.dart';

import '../widgets/CustomCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Trend",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
        child: FutureBuilder<List<ProductModel>>(
          future: get_all_product().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List <ProductModel> product =snapshot.data!;
              return GridView.builder(
                itemCount: product.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 100),
                itemBuilder: (context, index) {
                  return CustomCard(productModel: product[index],);
                },
              );
            } else {
             return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
