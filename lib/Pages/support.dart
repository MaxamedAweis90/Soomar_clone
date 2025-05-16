import 'package:flutter/material.dart';
import 'package:soomar_clone/utils/colors.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 243, 247),
      body: Column(
        children: [
          // Banner with logo
          Container(
            padding: const EdgeInsets.all(50),
            color: AppColors.secondaryColor,
            width: double.infinity,
            child: Center(
              child: Image.asset(
                'assets/images/soomarlogo.png', // Replace with your actual path
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Title and paragraph
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'How can I help you?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'We’re here to help you! with any questions or concerns you may have. Please choose a support option below.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Contact cards
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                _buildSupportCard(
                  title: 'KOONFURTA & BARTAMAHA',
                  phoneLabel: 'Call',
                  whatsappLabel: 'WhatsApp',
                ),
                const SizedBox(height: 16),
                _buildSupportCard(
                  title: 'SOMALILAND',
                  phoneLabel: 'Call',
                  whatsappLabel: 'WhatsApp',
                ),
                const SizedBox(height: 16),
                _buildSupportCard(
                  title: 'PUNTLAND',
                  phoneLabel: 'Call',
                  whatsappLabel: 'WhatsApp',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportCard({
    required String title,
    required String phoneLabel,
    required String whatsappLabel,
  }) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      color: AppColors.secondaryColor,
                      size: 30,
                    ),
                    const SizedBox(width: 11),
                    Text(phoneLabel),
                  ],
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    const Icon(
                      Icons.whatshot,
                      color: AppColors.secondaryColor,
                      size: 30,
                    ),
                    const SizedBox(width: 11),
                    Text(whatsappLabel),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
