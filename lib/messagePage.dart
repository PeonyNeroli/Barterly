import 'package:flutter/material.dart';
import 'package:barterly/custom_bottom_nav.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  bool showMessages = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 3,
        onTap: (int value) {},
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Notifications",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _buildTabButton("Messages", showMessages, () {
                    setState(() => showMessages = true);
                  }),
                  const SizedBox(width: 30),
                  _buildTabButton("Notifications", !showMessages, () {
                    setState(() => showMessages = false);
                  }, showDot: true),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(child: _buildMessageList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(
    String title,
    bool isSelected,
    VoidCallback onTap, {
    bool showDot = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
              if (showDot)
                Container(
                  margin: const EdgeInsets.only(left: 6),
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.only(top: 4),
            height: 3,
            width: isSelected ? 70 : 0,
            color: const Color(0xFF4A4AFA),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView(
      children: [
        _buildMessageTile(
          name: "Bert Pullman",
          status: "Online",
          time: "04:32 pm",
          message:
              "Congratulations on completing the first lesson, keep up the good work!",
        ),
        _buildMessageTile(
          name: "Daniel Lawson",
          status: "Online",
          time: "04:32 pm",
          message:
              "Your course has been updated, you can check the new course in your study course.",
          hasAttachment: true,
        ),
        _buildMessageTile(
          name: "Nguyen Shane",
          status: "Offline",
          time: "12:00 am",
          message:
              "Congratulations, you have completed your scheduled class. You can now access your next session.",
        ),
      ],
    );
  }

  Widget _buildMessageTile({
    required String name,
    required String status,
    required String time,
    required String message,
    bool hasAttachment = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor:
                    status == "Online"
                        ? Colors.green.shade100
                        : Colors.grey.shade300,
                child: Icon(
                  Icons.person,
                  color: status == "Online" ? Colors.green : Colors.grey,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 12,
                        color: status == "Online" ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          if (hasAttachment)
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFCE4EC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.insert_drive_file, color: Colors.pink),
              ),
            ),
        ],
      ),
    );
  }
}
