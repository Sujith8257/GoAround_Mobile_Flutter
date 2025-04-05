import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/intro-1.dart';
// Add imports for all screens used in routes
import 'verification.dart';
import 'home.dart';
import 'sign_in.dart';
import 'detail.dart'; // Add import for DetailsPage
import 'search.dart'; // Add import for SearchScreen
import 'edit.dart';
import 'profile.dart'; // Add import for profile

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoAround',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
      // Fixed routes section
      routes: {
        '/verification': (context) => const VerificationScreen(),
        '/home': (context) => const HomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/search': (context) => const SearchScreen(),
        '/details': (context) => DetailsPage(
          destination: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>,
        ),
        '/edit': (context) => const EditProfileScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _textWidthAnimation;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 0, end: -30).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOut),
      ),
    );

    _textWidthAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 800), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const OnboardScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 800),
              ),
            );
          }
        });
      }
    });
    _blinkCursor();
  }

  void _blinkCursor() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _showCursor = !_showCursor;
        });
        _blinkCursor();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final logoSize = screenSize.width * 0.18; // Reduced from 0.22
    final fontSize = screenSize.width * 0.07; // Reduced from 0.08

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(_slideAnimation.value, 0),
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Image.asset(
                        'assets/icons/logo-no-background-1.png',
                        width: logoSize,
                        height: logoSize * 0.9,
                      ),
                    ),
                  ),
                  SizedBox(
                      width:
                          screenSize.width * 0.005), // Further reduced spacing
                  ClipRect(
                    child: SizedBox(
                      width: fontSize *
                          4.2 *
                          _textWidthAnimation.value, // Adjusted multiplier
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'GoAround',
                            style: GoogleFonts.poppins(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          if (_showCursor)
                            Text(
                              '|',
                              style: GoogleFonts.poppins(
                                fontSize: fontSize * 0.9,
                                fontWeight: FontWeight.normal,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
