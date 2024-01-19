// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class CustomNavigationBar extends StatelessWidget {
  void Function(int)? onTabChange;
  CustomNavigationBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container( 
      color: Colors.grey[200],
      
      child:  GNav(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        color: Colors.grey[400],
        
        activeColor: Colors.grey.shade800,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        

        //step1
        onTabChange:(value) => onTabChange!(value),       
        
        tabs: 
      const [
        GButton(icon: Icons.home,text: '   Shop',),               
         GButton(icon: Icons.shopping_bag,text: '   Cart',),
      ]),
    );
  }
}