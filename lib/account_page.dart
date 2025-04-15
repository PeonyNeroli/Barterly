// Update account_page.dart

import 'package:flutter/material.dart';
import 'package:barterly/custom_bottom_nav.dart'; // Import the custom nav bar

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9FB),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 4,
        onTap: (int value) {},
      ), // Use the custom nav bar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.bookmark_added_rounded, color: Colors.green),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blue.shade100,
                      child: Image.asset(
                        'assets/images/avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.notifications,
                        size: 16,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              _buildMenuItem("Favourite"),
              _buildMenuItem("Edit Account"),
              _buildMenuItem("Settings and Privacy"),
              _buildMenuItem("Help"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
      trailing: Icon(Icons.visibility_off_rounded, color: Colors.grey),
      contentPadding: EdgeInsets.zero,
      onTap: () {
        // Add navigation logic if needed
      },
    );
  }
}
