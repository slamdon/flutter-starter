import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shopping/components/product_item.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/pages/cart_page.dart';
import 'package:shopping/providers/cart_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final products = [
    Product(
        'Pumpkin seed',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        10.5,
        5,
        'assets/food-1.png'),
    Product(
        'Peach',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        11.5,
        1,
        'assets/food-2.png'),
    Product(
        'Cheese',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        12.5,
        3,
        'assets/food-3.png'),
    Product(
        'Crayfish',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        13.5,
        2,
        'assets/food-4.png'),
    Product(
        'Potato pizza',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        14.5,
        4,
        'assets/food-5.png'),
    Product(
        'Spinach',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        15.5,
        1,
        'assets/food-6.png'),
    Product(
        'Scallop',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        16.5,
        4,
        'assets/food-7.png'),
    Product(
        'Salmon',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        17.5,
        3,
        'assets/food-8.png'),
    Product(
        'Cod',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        18.5,
        4,
        'assets/food-9.png'),
    Product(
        'Tuna',
        'Remain lively hardly needed at do by. Two you fat downs fanny three. True mr gone most at. Dare as name just when with it body. ',
        19.5,
        2,
        'assets/food-10.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "${_cart.products.length}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CartPage(_cart.products);
              }));
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Container(
              child: ProductItem(products[index]),
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            );
          },
        ),
        color: Color.fromRGBO(230, 230, 230, 1),
      ),
    );
  }
}
