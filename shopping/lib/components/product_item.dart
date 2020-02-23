import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return _buildProductContainer(context);
  }

  Widget _buildProductContainer(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        child: Padding(
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  child: _buildImageContainer(context),
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                ),
                flex: 1,
              ),
              Expanded(
                child: Padding(
                  child: Column(
                    children: <Widget>[
                      _buildInformationTopContainer(context),
                      _buildInformationMiddleContainer(context),
                      _buildInformationBottomContainer(context),
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                ),
                flex: 2,
              )
            ],
          ),
          padding: EdgeInsets.all(12),
        ),
        color: Colors.white,
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context) {
    return ClipRRect(
      child: SizedBox(
        child: Image.asset(
          this.product.imagePath,
          fit: BoxFit.cover,
        ),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  Widget _buildInformationTopContainer(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(this.product.title),
            flex: 1,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.product.score,
              itemBuilder: (context, index) {
                return Icon(Icons.star, color: Colors.yellow);
              },
            ),
            flex: 2,
          )
        ],
      ),
      height: 40,
    );
  }

  Widget _buildInformationMiddleContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Text(
        this.product.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  Widget _buildInformationBottomContainer(BuildContext context) {
    return Padding(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("\$ ${this.product.price}"),
            flex: 2,
          ),
          Expanded(
            child: Container(
              child: FlatButton(
                child: Text(
                  'Order',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final _cart = Provider.of<CartProvider>(context);
                  _cart.addProduct(this.product);
                },
              ),
              height: 20,
            ),
            flex: 2,
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
    );
  }
}
