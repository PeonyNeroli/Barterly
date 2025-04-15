import 'package:flutter/material.dart';
import 'package:barterly/custom_bottom_nav.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (int value) {},
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildCategoryChips(),
            const SizedBox(height: 30),
            _buildMentorSection(),
            const SizedBox(height: 20),
            _buildCourseCard(
              "Product Design v1.0",
              "Robertson Connie",
              190,
              16,
              "assets/images/course.png",
            ),
            _buildCourseCard(
              "Java Development",
              "Nguyen Shane",
              250,
              16,
              "assets/images/course.png",
            ),
            _buildCourseCard(
              "Visual Design",
              "Bert Pullman",
              250,
              14,
              "assets/images/course.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Explore Courses",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage("assets/avatar.png"),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Find Course",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Icon(Icons.tune, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    return Row(
      children: [
        _buildCategoryChip("Language", Colors.lightBlue.shade100),
        const SizedBox(width: 10),
        _buildCategoryChip("Painting", Colors.purple.shade100),
        const SizedBox(width: 10),
        _buildCategoryChip("Design", Colors.orange.shade100),
      ],
    );
  }

  Widget _buildCategoryChip(String label, Color bgColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildMentorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Choose your Mentor",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildTab("All", true),
            const SizedBox(width: 14),
            _buildTab("Popular", false),
            const SizedBox(width: 14),
            _buildTab("New", false),
          ],
        ),
      ],
    );
  }

  Widget _buildTab(String label, bool selected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Color(0xFF4A4AFA) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCourseCard(
    String title,
    String mentor,
    int pts,
    int hoursLeft,
    String imgPath,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imgPath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  mentor,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "PTS $pts",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A4AFA),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE0E0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "$hoursLeft hours",
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
