import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPopup extends StatelessWidget {
  const ForgotPasswordPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      // Remove fixed height to allow content to determine size
      constraints: const BoxConstraints(maxWidth: 335),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 39),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // This ensures the column takes minimum required space
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF3F51B5),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/email.svg',
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Check your email',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'ADLaM Display',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We have sent password recovery instruction to your email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'ADLaM Display',
                color: Color(0xFF8A8A8A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VerificationSuccessPopup extends StatelessWidget {
  const VerificationSuccessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      constraints: const BoxConstraints(maxWidth: 335),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 39),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF4CAF50),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Verification Successful',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your account has been verified successfully',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF8A8A8A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
