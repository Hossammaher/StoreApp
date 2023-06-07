import 'package:flutter/material.dart';
import 'package:store_app/screens/UpdatePage.dart';
import '../Model/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    required this.productModel,
    super.key,
  });
  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdatePage.id,arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  spreadRadius: 10,
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset(1, 1))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      productModel.title.substring(0, 10),
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r"$ " "${productModel.price.toString()}"),
                        Icon(
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
            top: -60,
            right: 32,
            child: Image.network(
              productModel.image,
              height: 100,
              width: 80,
            ),
          )
        ],
      ),
    );
  }
}
