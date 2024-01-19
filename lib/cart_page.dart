import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/shoe.dart';

import 'cart.dart';
import 'cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [          
          const Padding(
            padding: EdgeInsets.only(left: 25.0, top: 25.0),
            child: Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.getUserCart().length,
              itemBuilder: (context, index) {
                Shoe individualShoe = value.getUserCart()[index];
                return CartItem(
                  shoe: individualShoe,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
