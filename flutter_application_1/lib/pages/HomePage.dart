// ignore: file_names, depend_on_referenced_packages
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CategoriesWidget.dart';
import 'package:flutter_application_1/widgets/HomeAppBar.dart';
import 'package:flutter_application_1/widgets/ItemsWidget.dart';
import 'package:flutter_application_1/pages/cartPage.dart';
import 'package:flutter_application_1/pages/chatPage.dart';
import 'package:flutter_application_1/pages/ProfileUserPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomepageContent(),
    const CartPage(),
    const ProfileUserPage(), // Memasukkan ProfileUserPage di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Mengupdate indeks saat nav bar ditekan
          });
        },
        height: 70,
        color: const Color(0xFF40C4FF), // Warna biru laut cerah
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatPage()),
          );
        },
        backgroundColor: const Color(0xFF40C4FF),
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}

class HomepageContent extends StatelessWidget {
  const HomepageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const HomeAppBar(),
        Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              // Search bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 50,
                      width: 300,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here...",
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.camera_alt,
                      size: 27,
                      color: Color(0xFF40C4FF), // Warna biru laut cerah
                    ),
                  ],
                ),
              ),
              // Categories title
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF40C4FF), // Warna biru laut cerah
                  ),
                ),
              ),
              const CategoriesWidget(),
              // Best Selling title
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const Text(
                  'Best Selling',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF40C4FF), // Warna biru laut cerah
                  ),
                ),
              ),
              ItemsWidget(),
            ],
          ),
        ),
      ],
    );
  }
}

