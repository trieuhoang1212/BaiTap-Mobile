import 'package:flutter/material.dart';
import 'page_indicator.dart';

// Constants
class AppConstants {
  static const double paddingLarge = 20.0;
  static const double paddingMedium = 16.0;
  static const double paddingSmall = 10.0;
  static const int pageAnimationDuration = 300;
}

// 1. MODEL
class OnboardingModel {
  final String image;
  final String title;
  final String description;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const OnboardingScreen(),
    );
  }
}

// 2. DATA SOURCE
class OnboardingData {
  static const List<OnboardingModel> contents = [
    OnboardingModel(
      image: 'assets/images/background.png',
      title: 'Easy Time Management',
      description:
          'With management based on priority and daily tasks, it will give you convenience in managing and determining the tasks that must be done first',
    ),
    OnboardingModel(
      image: 'assets/images/background1.png',
      title: 'Increase Work Effectiveness',
      description:
          'Time management and the determination of more important tasks will give your job statistics better and always improve',
    ),
    OnboardingModel(
      image: 'assets/images/background2.png',
      title: 'Reminder Notification',
      description:
          'The advantage of this application is that it also provides reminders for you so you don\'t forget to keep doing your assignments well.',
    ),
  ];
}

// 3. SCREEN 
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _goToNextPage() {
    if (_currentIndex == OnboardingData.contents.length - 1) {
      _navigateToHome();
    } else {
      _pageController.nextPage(
        duration: const Duration(
          milliseconds: AppConstants.pageAnimationDuration,
        ),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(
        milliseconds: AppConstants.pageAnimationDuration,
      ),
      curve: Curves.easeInOut,
    );
  }

  void _skipToLastPage() {
    _pageController.animateToPage(
      OnboardingData.contents.length - 1,
      duration: const Duration(
        milliseconds: AppConstants.pageAnimationDuration,
      ),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToHome() {
    debugPrint("Navigate to Home/Login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          child: PageIndicator(
            currentIndex: _currentIndex,
            totalPages: OnboardingData.contents.length,
          ),
        ),
        actions: [
          if (_currentIndex < OnboardingData.contents.length - 1)
            TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.transparent),
              ),
              onPressed: _skipToLastPage,
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
        ],
      ),

      body: PageView.builder(
        controller: _pageController,
        itemCount: OnboardingData.contents.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return OnboardingContentWidget(model: OnboardingData.contents[index]);
        },
      ),
      bottomNavigationBar: OnboardingNavigationBar(
        currentIndex: _currentIndex,
        totalPages: OnboardingData.contents.length,
        onNextPressed: _goToNextPage,
        onBackPressed: _goToPreviousPage,
      ),
    );
  }
}

// 4. NAVIGATION BAR WIDGET 
class OnboardingNavigationBar extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNextPressed;
  final VoidCallback onBackPressed;

  const OnboardingNavigationBar({
    super.key,
    required this.currentIndex,
    required this.totalPages,
    required this.onNextPressed,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (currentIndex > 0) ...[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                shape: const CircleBorder(),
              ),
              onPressed: onBackPressed,
              child: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: AppConstants.paddingSmall),
          ],
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: onNextPressed,
              child: Text(
                currentIndex == totalPages - 1 ? 'Get Started' : 'Next',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 5. CONTENT WIDGET
class OnboardingContentWidget extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingContentWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(model.image)),
          const SizedBox(height: AppConstants.paddingLarge),
          Text(
            model.title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
