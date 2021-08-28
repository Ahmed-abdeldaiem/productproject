import 'package:flutter/material.dart';
//widget product item

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/product.dart';
import '../provider/cart.dart';

class ProductItem extends StatefulWidget {
  //final String imageurl, tite;
  const ProductItem({Key? key}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context);
    var cart = Provider.of<Carts>(context);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              child: Image.network(product.imageurl),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  width: 160,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (product.isFav) {
                              Provider.of<Products>(context, listen: false)
                                  .removeFavProduct(product.title);
                              product.isFav = false;
                            } else {
                              Provider.of<Products>(context, listen: false)
                                  .addFavProduct(product.title);
                              product.isFav = true;
                            }
                          });
                        },
                        icon: Icon(product.isFav
                            ? Icons.favorite
                            : Icons.favorite_border),
                        color: Colors.red,
                      ),
                      Text(
                        product.title,
                        style: GoogleFonts.amita(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        //add cart action
                        onPressed: () {
                          setState(() {
                            cart.addcart(product.title, product.price);
                          });
                        },
                        icon: Icon(Icons.add_shopping_cart),
                        color: Colors.orange.shade300,
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );

    ///create product item with provider and stack
  }
}
