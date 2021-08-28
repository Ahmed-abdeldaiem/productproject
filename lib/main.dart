import 'package:flutter/material.dart';
import 'package:productproject/provider/product.dart';
import 'package:productproject/screens/products_screen.dart';
import 'package:provider/provider.dart';
//import './screens/products_screen.dart';
import './screens/main_app_screen.dart';
//import './widgets/drawer.dart';
import './provider/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Carts())
      ],
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.pinkAccent,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 250, 220, 1)),
        home: MainAppScreen(),
        routes: {
          ProductScreen.routename: (ctx) => ProductScreen(),
          //  DrowerWidget.routename: (ctx) => DrowerWidget(),
        },
      ),
    );
  }
}
