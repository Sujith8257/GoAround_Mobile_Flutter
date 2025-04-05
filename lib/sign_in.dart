import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sign_up.dart';
import 'forget_password.dart'; // Add this import

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                // Back Button
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
                // Heading
                Column(
                  children: const [
                    Text(
                      "Sign in now",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Please sign in to continue our app",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Email Input
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email Id',
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Password Input
                TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
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
                // Forget Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF0D6EFD),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Sign In Button
                ElevatedButton(
                  // Inside the ElevatedButton's onPressed method for Sign In
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
                    "Sign In",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // OR Divider
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
                // Google Button
                OutlinedButton.icon(
                  // Inside the OutlinedButton.icon's onPressed method for Google Sign In
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
                const SizedBox(height: 40),
                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF7D848D),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Updated navigation code with more explicit route
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF0D6EFD),
                        ),
                      ),
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
