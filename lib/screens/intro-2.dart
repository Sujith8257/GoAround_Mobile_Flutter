import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardScreen2 extends StatelessWidget {
  const OnboardScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 444,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/intro-2.png'),
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
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content Section
          Positioned(
            top: 484,
            left: 27,
            right: 27,
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
                            text: 'It\'s a big world out there go ',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'explore',
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
                    SvgPicture.asset(
                      'assets/icons/vector-2524.svg',
                      width: 102,
                      height: 11,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'To get the best of your adventure you just need to leave and go where you like. We are waiting for you.',
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
                _buildDot(false, 13),
                const SizedBox(width: 5),
                _buildDot(true, 35),
                const SizedBox(width: 5),
                _buildDot(false, 13),
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
                backgroundColor: Color(0xFF0D6EFD),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
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
        color: isActive ? Color(0xFF0D6EFD) : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
