import 'package:ecommerce_app/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 50,
              color: Theme.of(context).colorScheme.secondary,
            ),

            const SizedBox(
              height: 20,
            ),

            //title
            const Text(
              'Online Shopping',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(
              height: 10,
            ),
            //subtitle
            Text(
              'Premium Quality Products',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),

            const SizedBox(
              height: 10,
            ),
            //button
            MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
