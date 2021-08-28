import 'package:flutter/material.dart';
import 'package:productproject/provider/product.dart';
import 'package:provider/provider.dart';
import '../screens/products_screen.dart';
import '../screens/favirite_screen.dart';
import '../widgets/drawer.dart';
import '../provider/cart.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  _MainAppScreenState createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _curentindex = 0;
  late List<Map<String, dynamic>> _pages;
  @override
  void initState() {
    _pages = [
      {'title': 'My Shop', 'body': ProductScreen()},
      {'title': 'Favorits', 'body': FavoriteScreen()}
    ];
    super.initState();
  }

  void changeindex(int index) {
    setState(() {
      _curentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cartlist = Provider.of<Carts>(context).getCarts;

    return Scaffold(
      drawer: Drawer(
        //child drawer widget

        child: DrowerWidget(),
      ),
      appBar: AppBar(
        title: Text(_pages[_curentindex]['title']),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                tooltip: 'Open shopping cart',
                onPressed: () {
                  // handle the press
                },
              ),
              Positioned(
                right: 12,
                top: 2,
                child: Text(
                  '${cartlist.length}',
                  style: TextStyle(
                    backgroundColor: Colors.blue[900],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: _pages[_curentindex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentindex,
        onTap: changeindex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
        ],
      ),
    );
  }
}
