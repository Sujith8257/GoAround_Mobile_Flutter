import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'intro-2.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hero Image Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 444,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/intro-1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 55,
                    right: 20,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Skip',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Skip Button
          Positioned(
            top: 55,
            right: 25,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // Content Section
          Positioned(
            top: 484,
            left: 33,
            right: 33,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Life is short and the world is ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'wide',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/icons/vector-2524.svg',
                        width: 63,
                        height: 11,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Pagination Dots
          Positioned(
            bottom: 105,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(true, 35),
                const SizedBox(width: 5),
                _buildDot(false, 13),
                const SizedBox(width: 5),
                _buildDot(false, 10),
              ],
            ),
          ),

          // Get Started Button
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D6EFD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardScreen2(),
                  ),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive, double width) {
    return Container(
      width: width,
      height: 7,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF0D6EFD) : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
