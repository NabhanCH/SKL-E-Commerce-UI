import 'package:flutter/material.dart';
import 'LoginPage.dart'; 

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  _ProfileUserPageState createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  String profileDescription = "This is your profile description.";
  List<String> purchasedItems = ['Product 1', 'Product 2', 'Product 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Color(0xFF40C4FF)),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF40C4FF)), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            _buildProfileSection(),
            const SizedBox(height: 20),
            
            _buildPurchasedItemsSection(),
            const SizedBox(height: 20),
            
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  
  Widget _buildProfileSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 174, 255)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF40C4FF),
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Anies Baswedan',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        profileDescription,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Color(0xFF40C4FF)),
                  onPressed: _editProfileDescription, 
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildPurchasedItemsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Purchased Items',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 174, 255)),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              itemCount: purchasedItems.length,
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(purchasedItems[index]),
                  leading: const Icon(Icons.shopping_bag, color: Color(0xFF40C4FF)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent, 
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: const Icon(Icons.logout, color: Colors.white),
        label: const Text(
          'Log Out',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {
          _logout(context); 
        },
      ),
    );
  }

 
  void _editProfileDescription() {
    TextEditingController controller = TextEditingController(text: profileDescription);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profile Description'),
          content: TextField(
            controller: controller,
            maxLength: 100,
            decoration: const InputDecoration(
              hintText: 'Enter your new profile description',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  profileDescription = controller.text; 
                });
                Navigator.pop(context); 
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  
  void _logout(BuildContext context) {
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()), 
    );
  }
}
