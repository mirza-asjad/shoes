import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/shoe.dart';
import 'package:shoes/shoe_tile.dart';

import 'cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String _searchText = '';

  // Function to handle the user's input in the search field
  void _onSearchTextChanged(String text) {
    setState(() {
      _searchText = text;
    });
  }

  // Function to filter the shoes based on the search query
  List<Shoe> _filteredShoes(List<Shoe> shoes) {
    if (_searchText.isEmpty) {
      return shoes;
    } else {
      return shoes
          .where((shoe) =>
              shoe.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    }
  }

  // Function to add shoe to Cart
  void addShoetoCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemCart(shoe);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully Added to Cart'),
        content: Text('Check Your Cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final allShoes = cart.getShoeList();

    // Filtered shoes based on the search query
    final filteredShoes = _filteredShoes(allShoes);

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: _onSearchTextChanged,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const Icon(Icons.search),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredShoes.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final shoe = filteredShoes[index];
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoetoCart(shoe),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25, top: 25),
            child: Divider(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
