import 'package:ecommerce_app/components/my_button.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show  a dialog box to user confirm to remove from cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text('Remove this item from your cart?'),
              actions: [
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),

                //yes button
                MaterialButton(
                  onPressed: () {
                    //pop dialog box
                    Navigator.pop(context);

                    //add to cart
                    context.read<Shop>().removeToCart(product);
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  // user pressed pay button

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
          'User wants to pay! Connect this app to your payment backend',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Cart Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          //cart item
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text(
                    'User cart is Empty',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get indiviual item in cart
                      final item = cart[index];

                      // return as a cart tile UI
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ListTile(
                          leading: ConstrainedBox(
                            constraints: const BoxConstraints(
                                maxHeight: 100, maxWidth: 100),
                            child: Image.asset(item.imagePath),
                          ),
                          title: Text(item.name),
                          subtitle:
                              Text('Rs. ' + item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text('Pay Now')),
          )
        ],
      ),
    );
  }
}
