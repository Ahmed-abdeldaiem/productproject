import 'package:flutter/material.dart';

class DrowerWidget extends StatelessWidget {
  //static const routename = '/drower_screen';
  const DrowerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Theme.of(context).primaryColor,
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                'Menu',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
        ListTile(
          onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          leading: Icon(Icons.shop_sharp),
          title: Text(
            'Shop',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(
          thickness: 1.5,
          height: 0,
        ),
        ListTile(
          leading: Icon(Icons.credit_card),
          // onTap: () => Navigator.of(context).pushNamed(orderScreen.routename),
          title: Text('Order', style: TextStyle(fontSize: 20)),
        ),
        Divider(
          thickness: 1.5,
          height: 0,
        ),
        ListTile(
          leading: Icon(Icons.edit_rounded),
          // onTap: () => Navigator.of(context).pushNamed(SettingScreen.routename),
          title: Text('Manage Product', style: TextStyle(fontSize: 20)),
        )
      ],
    );
  }
}
