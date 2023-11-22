import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Category buttons
            buildCategoryButton('Cart', Icons.shopping_cart),
            buildCategoryButton('3D Model', Icons.wrap_text),
            buildCategoryButton('Search', Icons.search),
            buildCategoryButton('Reviews', Icons.star),
            buildCategoryButton('Wishlist', Icons.favorite),
            buildCategoryButton('Order History', Icons.history),
            const SizedBox(height: 20),
            const Text(
              'Getting Started',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Getting started content
            const Text(
              'Welcome to our app! Here are some basic tips to get started...',
              style: TextStyle(fontSize: 16),
            ),
            // Additional sections, accordion style, etc.
          ],
        ),
      ),
    );
  }

  Widget buildCategoryButton(String title, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        // Handle button press, navigate to the specific section, etc.
      },
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
