import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemsWidget extends StatelessWidget {
  ItemsWidget({super.key});

  List<String> myProductName = [
    'JORDAN LOW BLUE',
    'KREMLIN HYPEX',
    'NIKON Z9 ULTRA',
    'MOUNT DEW VOLT',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < myProductName.length; i++)
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20), 
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'itemPage');
                      },
                      child: Container(
                        margin: EdgeInsets.zero,
                        alignment: Alignment.center, 
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15), 
                          child: Image.asset(
                            'images/${i + 1}.jpeg',
                            height: 180, // Memperbesar tinggi gambar
                            width: 180, // Mengubah lebar gambar agar berbentuk kotak
                            fit: BoxFit.cover, 
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF40C4FF), 
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          '-50%',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    myProductName[i], 
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF40C4FF), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Barang yang anda cari dari tahun sebelumnya!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF40C4FF), 
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$55',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF40C4FF), 
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart_checkout,
                        color: Color(0xFF40C4FF), 
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
