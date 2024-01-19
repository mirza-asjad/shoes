import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoes/custom_drawer.dart';
import 'package:shoes/custom_gnav.dart';
import 'package:shoes/shop_page.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void navigateBottomBar(int index)
  {
    setState(() {
      _selectedIndex = index;
    });
  }


  //pages to display

  final List<Widget> _pages = [

    const ShopPage(),

    const CartPage(),

  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('S H O E S',        
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
        centerTitle: true,
        
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.settings,
            size: 24,),
          )
        ],        
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomNavigationBar(
        onTabChange: (index)=> navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}