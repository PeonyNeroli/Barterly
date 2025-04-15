import 'package:barterly/MessagePage.dart';
import 'package:flutter/material.dart';
import 'package:barterly/custom_bottom_nav.dart'; // Import the custom nav bar
import 'course.dart';
import 'drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (int value) {},
      ), // Use the custom nav bar
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            _buildHeader(),
            SizedBox(height: 20),
            _buildProgressCard(),
            SizedBox(height: 20),
            _buildExploreSection(),
            SizedBox(height: 20),
            _buildLearningPlan(),
            SizedBox(height: 20),
            _buildBarterlyCard(),
          ],
        ),
      ),
    );
  }

  // Rest of your HomePage code remains the same
  Widget _buildHeader() {
    // Your existing code
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hi, Paijo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Let's start learning", style: TextStyle(color: Colors.grey)),
          ],
        ),
        const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(
            'assets/avatar.png',
          ), // Replace with your asset
        ),
      ],
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF4F7FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Learned today",
                style: TextStyle(color: Colors.grey.shade700),
              ),
              Text("My courses", style: TextStyle(color: Color(0xFF4A4AFA))),
            ],
          ),
          SizedBox(height: 12),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "46min ",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "/ 60min",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: 46 / 60,
            color: Color(0xFFFC8956),
            backgroundColor: Color(0xFFFDDDD0),
          ),
        ],
      ),
    );
  }

  Widget _buildExploreSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFD9EEFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What do you want\nto explore today?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF7A50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Get Started"),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xFFE8F6F0),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLearningPlan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Learning Plan",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildCourseProgress("Barista", 40, 48),
              SizedBox(height: 10),
              _buildCourseProgress("UI/UX Programmer", 6, 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseProgress(String title, int completed, int total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.circle_outlined, size: 20),
            SizedBox(width: 10),
            Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        Text("$completed/$total", style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildBarterlyCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF1E8FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Barterly",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Color(0xFF5B2EFF),
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Off-line exchange of learning experiences",
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
