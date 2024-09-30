import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  final ScrollController _scrollController = ScrollController(); 

  
  final List<Map<String, String>> categories = [
    {'image': 'images/1.jpeg', 'text': 'SHOES ULT'},
    {'image': 'images/2.jpeg', 'text': 'SHIRT ULT'},
    {'image': 'images/3.jpeg', 'text': 'CAMERA ULT'},
    {'image': 'images/4.jpeg', 'text': 'DRINK ULT'},
  ];

  
  void _scrollToIndex(int index) {
    double position = index * 120.0; 
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController, 
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            GestureDetector(
              onTap: () {
                
                _scrollToIndex(i);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), 
                      child: Image.asset(
                        categories[i]['image']!, 
                        width: 40,
                        height: 40,
                      ),
                    ),
                    const SizedBox(width: 8), 
                    Text(
                      categories[i]['text']!, 
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color(0xFF40C4FF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); 
    super.dispose();
  }
}
