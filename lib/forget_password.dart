import 'package:flutter/material.dart';
import 'forgot_password_popup.dart';
import 'verification.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Back Button
                CircleAvatar(
                  backgroundColor: const Color(0xFFF2F2F2),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded,
                        size: 20, color: Color(0xFF8E8E8E)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 40),
                // Heading
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Forgot password',
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: 'ADLaM Display',
                          color: Color(0xFF3A3A3A),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Enter your email account to reset your password',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'ADLaM Display',
                          color: Color(0xFF7C838D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // Email Input
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Email',
                      hintStyle: TextStyle(
                        fontFamily: 'ADLaM Display',
                        fontSize: 16,
                        color: Color(0xFF3A3A3A),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Reset Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Show popup dialog in the middle of the screen
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          // Automatically navigate to verification screen after 1 second
                          Future.delayed(const Duration(seconds: 1), () {
                            Navigator.of(context).pop(); // Close the dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VerificationScreen(),
                              ),
                            );
                          });
                          
                          return const Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: ForgotPasswordPopup(),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D6EFD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                        fontFamily: 'ADLaM Display',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
