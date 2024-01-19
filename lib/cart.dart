import 'package:flutter/material.dart';
import 'package:shoes/shoe.dart';

class Cart extends ChangeNotifier{
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Nike Blash',
      price: '\$236',
      imagePath: 'images/sneakers8.jpg',
      description: 'Best Shoes',
    ),

    Shoe(
      name: 'Nike Black',
      price: '\$296',
      imagePath: 'images/sneakers2.png',
      description: 'Best Shoes',
    ),

    Shoe(
      name: 'Nike Star',
      price: '\$99',
      imagePath: 'images/sneakers3.png',
      description: 'Best Shoes',
    ),

    Shoe(
      name: 'Nike Blue',
      price: '\$201',
      imagePath: 'images/sneakers4.png',
      description: 'Best Shoes',
    ),

    Shoe(
      name: 'Nike Mix',
      price: '\$89',
      imagePath: 'images/sneakers5.png',
      description: 'Best Shoes',
    ),

    Shoe(
      name: 'Nike Red',
      price: '\$109',
      imagePath: 'images/sneakers6.png',
      description: 'Best Shoes',
    ),


    Shoe(
      name: 'Nike Sneakers',
      price: '\$199',
      imagePath: 'images/sneakers7.png',
      description: 'Best Shoes',
    ),
  ];


  //user cart item

  List<Shoe> userCart = [];



  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  // get cart

  List<Shoe> getUserCart()
  {
    return userCart;
  }

  //add items

  void addItemCart(Shoe shoe)
  {
    userCart.add(shoe);
    notifyListeners();
  }


  //removing
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}
