import 'package:flutter/material.dart';
import 'package:productproject/widgets/product_item.dart';
// product provider
import '../provider/product.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  static const routename = '/product_screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var args =
    // ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var products = Provider.of<Products>(context).getProducts;

    return Scaffold(
      // appBar: AppBar(
      //  title: Text('My Shop'),
      //  ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisExtent: 150,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 2 / 2,
        ),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          // product item
          value: products[index],
          child: ProductItem(),
        ),
        //
        itemCount: products.length,
      ),
    );
  }
}
