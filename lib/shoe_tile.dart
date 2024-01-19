import 'package:flutter/material.dart';
import 'package:shoes/shoe.dart';

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  void Function()? onTap;
  ShoeTile({Key? key, required this.shoe, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: 280,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  //pic
                  Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    width: 200, // Specify the desired width for the image
                    height: 250, // Specify the desired height for the image
                    child: Image.asset(shoe.imagePath),
                  ),

                  
        
                  //desc (Add your description widget here)
                  Text(
                    shoe.description,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
        
        
                  const Spacer(),
        
                  //details (Add your details widget here)
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(  
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(shoe.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                            const SizedBox(height: 5,)
                            ,
                            Text(shoe.price),
                          ],
                          
                        ),
                  
                        GestureDetector(
                          onTap: onTap ,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomRight: Radius.circular(12)),),
                            child: const Icon(Icons.add,color: Colors.white,),
                                    
                          ),
                        )
                      ],
                    ),
                  )
        
                  //button (Add your button widget here)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}