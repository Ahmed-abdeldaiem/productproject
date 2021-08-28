import 'package:flutter/material.dart';
import 'package:productproject/widgets/product_item.dart';
// product provider
import '../provider/product.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favproducts = Provider.of<Products>(context).getFav;
    return Scaffold(
      // appBar: AppBar(
      //  title: Text('Favorite'),
      // ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: favproducts[i],
          child: ProductItem(),
        ),
        itemCount: favproducts.length,
      ),
    );
  }
}
