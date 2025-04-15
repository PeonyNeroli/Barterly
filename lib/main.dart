import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'login_page.dart';
import 'homepage.dart';
import 'course.dart';
import 'search_page.dart';
import 'MessagePage.dart';
import 'account_page.dart';
import 'custom_bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barterly',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    _currentPage != 2
                        ? GestureDetector(
                          onTap:
                              () => _pageController.animateToPage(
                                2,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              ),
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        )
                        : const SizedBox(height: 14),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildPage(
                    image: 'assets/images/girl_illustration.png',
                    title: 'Explore Your Dream Skills',
                    subtitle:
                        'Free courses for you to\nfind your way to learn new skills',
                    bgColor: const Color(0xFFADD8E6),
                  ),
                  _buildPage(
                    image: 'assets/images/man_with_phone.png',
                    title: 'Quick and easy learning',
                    subtitle:
                        'Easy and fast learning at\nany time to help you improve various skills',
                    bgColor: const Color(0xFFCFFFDC),
                  ),
                  _buildPage(
                    image: 'assets/images/study_plan_illustration.png',
                    title: 'Create your own\nstudy plan',
                    subtitle:
                        'Study according to the\nstudy plan, make study more motivated',
                    bgColor: const Color(0xFFF0F0FF),
                  ),
                ],
              ),
            ),
            if (_currentPage != 2) _buildIndicator(),
            if (_currentPage == 2)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 32.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String subtitle,
    required Color bgColor,
  }) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(110),
          ),
          child: Center(
            child: Image.asset(
              image,
              width: 180,
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildDot(_currentPage == 0),
          const SizedBox(width: 4),
          _buildDot(_currentPage == 1),
          const SizedBox(width: 4),
          _buildDot(_currentPage == 2),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

// Root page for the app after onboarding, login or signup
class MainApp extends StatefulWidget {
  const MainApp({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _pages = [
    const HomePage(),
    const CoursePage(),
    const SearchPage(),
    const MessagePage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (int value) {},
      ),
    );
  }
}
