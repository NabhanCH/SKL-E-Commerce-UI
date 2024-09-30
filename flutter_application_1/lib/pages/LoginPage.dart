import 'package:flutter/material.dart';
import 'HomePage.dart'; 

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Color(0xFF40C4FF)), 
        ),
        backgroundColor: Colors.white, 
        iconTheme: const IconThemeData(color: Color(0xFF40C4FF)), 
        elevation: 0, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            _buildHeader(),
            const SizedBox(height: 32.0), 
           
            _buildTextField(
              label: 'Username',
              icon: Icons.person,
              obscureText: false,
            ),
            const SizedBox(height: 16.0),
           
            _buildTextField(
              label: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildElevatedButton(
                  context,
                  label: 'Login',
                  icon: Icons.login,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homepage(),
                      ),
                    );
                  },
                ),
                _buildElevatedButton(
                  context,
                  label: 'Daftar',
                  icon: Icons.app_registration,
                  onPressed: () {
                    Navigator.pushNamed(context, 'registerPage');
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Skip Button
            _buildElevatedButton(
              context,
              label: 'Skip',
              icon: Icons.skip_next,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _buildHeader() {
    return const Column(
      children: [
        Text(
          'NATA-PEDIA!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF40C4FF), 
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Temukan produk terbaik dengan harga terjangkau.\nBelanja dengan mudah dan cepat!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

 
  Widget _buildTextField({
    required String label,
    required IconData icon,
    required bool obscureText,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF40C4FF)),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xFF40C4FF)),
        ),
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }

  
  Widget _buildElevatedButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF40C4FF), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)), 
        ],
      ),
    );
  }

  
  Widget _buildTextButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent, 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white)), 
        ],
      ),
    );
  }
}
