import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/aboutPage.dart'; // Import halaman AboutPage

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          
          InkWell(
            onTap: () {
              
            },
            child: const Icon(
              Icons.sort,
              size: 30,
              color: Color(0xFF40C4FF),
            ),
          ),
          const SizedBox(width: 20),
          
          const Text(
            'NATA-PEDIA',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF40C4FF), 
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
        
          InkWell(
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
            child: const Icon(
              Icons.info_outline, 
              size: 32,
              color: Color(0xFF40C4FF), 
            ),
          ),
        ],
      ),
    );
  }
}
