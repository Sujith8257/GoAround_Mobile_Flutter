import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Remove the main function and SignUpApp class since they won't be needed
// when this is used as a screen in your app

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Back Button - Fixed icon loading
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xFFF5F5F5),
                    child: IconButton(
                      icon:
                          SvgPicture.asset('assets/icons/back.svg', width: 22),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Column(
                  children: const [
                    Text(
                      "Sign up now",
                      style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'ADLaM Display',
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Please fill the details and create account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF7c838d),
                        fontFamily: 'ADLaM Display',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Leonardo Smith',
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password must be 8 characters",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7c838d),
                      fontFamily: 'ADLaM Display',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  // Inside the ElevatedButton's onPressed method
                  onPressed: () {
                  // Navigate directly to home screen without authentication
                  Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(56),
                    backgroundColor: const Color(0xFF0D6EFD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'ADLaM Display',
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(child: Divider(endIndent: 8)),
                    Text(
                      "Or",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Expanded(child: Divider(indent: 8)),
                  ],
                ),
                const SizedBox(height: 16),
                // Keeping flutter_svg import since we'll use SvgPicture instead of Image.asset for SVG files

                // Google button section
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    // Navigate directly to home screen without authentication
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0x66000000)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                  ),
                  icon: SvgPicture.asset('assets/icons/google.svg', width: 22),
                  label: const Text(
                    "CONTINUE WITH GOOGLE",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF413F3F),
                    ),
                  ),
                ),

                // Fixed Spacer issue in SingleChildScrollView
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Sign in"),
                    )
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
