import 'package:ecommerce_app/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //head of drawer
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 80,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // shop tile
              MyListTile(
                text: 'Shop',
                icons: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              //cart tile
              MyListTile(
                  text: 'cart',
                  icons: Icons.shopping_cart,
                  onTap: () => Navigator.pushNamed(context, '/cart_page')),
            ],
          ),
          //Exit tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
                text: 'Exit',
                icons: Icons.logout,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/intro_page', (route) => false)),
          ),
          //cart tile

          //exit shop tile
        ],
      ),
    );
  }
}
