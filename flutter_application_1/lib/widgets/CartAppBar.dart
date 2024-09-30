import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), 
          ),
        ],
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
         
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xFF40C4FF), 
            ),
          ),
          const SizedBox(width: 20),
          
          const Text(
            'Cart',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF40C4FF), 
            ),
          ),
          const Spacer(),
          
          InkWell(
            onTap: () {
              
            },
            child: const Icon(
              Icons.more_vert,
              size: 30,
              color: Color(0xFF40C4FF), 
            ),
          ),
        ],
      ),
    );
  }
}
