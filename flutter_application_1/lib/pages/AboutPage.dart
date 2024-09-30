import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, 
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF40C4FF)), 
        title: const Text(
          'About NATA-PEDIA',
          style: TextStyle(
            color: Color(0xFF40C4FF), 
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFE0F7FA)], 
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('About Us'),
              _buildCard(
                context,
                Icons.info_outline_rounded,
                'NATA-PEDIA adalah platform e-commerce yang didirikan pada tahun 2020 oleh CEO John Doe. '
                'Sejak didirikan, kami telah berkembang pesat dan kini memiliki lebih dari 500.000 pengguna '
                'terdaftar dari seluruh Indonesia.',
              ),
              const SizedBox(height: 20),
              _buildSectionHeader('Sistem Pembayaran'),
              _buildCard(
                context,
                Icons.payment_rounded,
                '- Kartu Kredit/Debit\n- Transfer Bank\n- E-Wallet (OVO, GoPay, Dana)\n- Cash on Delivery (COD)',
              ),
              const SizedBox(height: 20),
              _buildSectionHeader('Jenis Barang yang Dijual'),
              _buildCard(
                context,
                Icons.shopping_bag_rounded,
                '- Fashion\n- Elektronik\n- Buku\n- Peralatan Rumah Tangga\n- Mainan dan Hobi',
              ),
              const SizedBox(height: 20),
              _buildSectionHeader('Kantor Pusat'),
              _buildCard(
                context,
                Icons.location_on_rounded,
                'Jl. Sudirman No. 123, Jakarta, Indonesia',
              ),
              const SizedBox(height: 20),
              _buildSectionHeader('Customer Service'),
              _buildCard(
                context,
                Icons.support_agent_rounded,
                'Nomor: +62 21 12345678\nEmail: support@natashop.com',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Color(0xFF40C4FF), 
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, IconData icon, String content) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30, color: const Color(0xFF40C4FF)), 
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
