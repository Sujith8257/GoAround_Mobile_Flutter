import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../sign_in.dart';  // Add this import

class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 444,
            child: Image.asset(
              'assets/icons/intro-3.png',
              fit: BoxFit.cover,
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
                  color: Color(0xFFCAEAFF),
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // Content Section
          Positioned(
            top: 484,
            left: 22,
            right: 22,
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B1E28),
                    ),
                    children: [
                      TextSpan(text: 'People don\'t take trips, trips take '),
                      TextSpan(
                        text: 'people',
                        style: TextStyle(color: Color(0xFFFF7029)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SvgPicture.asset(
                  'assets/icons/vector-2524.svg',
                  width: 63,
                  height: 11,
                ),
                const SizedBox(height: 16),
                const Text(
                  'To get the best of your adventure you just need to leave and go where you like. we are waiting for you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 48),
                // Pagination Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(false, 13),
                    const SizedBox(width: 5),
                    _buildDot(false, 13),
                    const SizedBox(width: 5),
                    _buildDot(true, 35),
                  ],
                ),
              ],
            ),
          ),

          // Next Button
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D6EFD),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text(
                'Next',
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
