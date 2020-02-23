import 'package:flutter/material.dart';
import 'package:shopping/model/product.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;
  CartPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Container(
        child: ListView.separated(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Container(
              child: Center(
                child: Text(
                  products[index].title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              height: 60,
              color: Colors.white70,
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
        color: Color.fromRGBO(230, 230, 230, 1),
      ),
    );
  }
}
