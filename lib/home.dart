import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'detail.dart'; // Add this import for navigation
import 'profile.dart'; // Add this import for profile navigation

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Add 'static const' to make these compatible with a const constructor
  static final List<Map<String, dynamic>> destinations = [
    {
      "id": 1,
      "name": "Tirupati",
      "state": "Andhra Pradesh",
      "fontWeight": FontWeight.bold, // Changed from w600 to bold
      "rating": "4.7",
      "image": "assets/icons/tri.jpg",
    },
    {
      "id": 2,
      "name": "Kanniyakumari",
      "state": "Tamil Nadu",
      "fontWeight": FontWeight.bold, // Changed from w600 to bold
      "rating": "4.9",
      "image": "assets/icons/kan.jpg",
    },
  ];

  static final List<Map<String, dynamic>> navItems = [
    {
      "id": 1,
      "name": "Home",
      'iconAsset': 'assets/icons/Home.svg',
      "active": true
    },
    {"id": 2, "name": "Train", "icon": Icons.train, "active": false},
    {
      "id": 3,
      "name": "Purpose",
      'iconAsset': 'assets/icons/purpose.svg',
      "active": false
    },
    {
      "id": 4,
      "name": "Profile",
      'iconAsset': 'assets/icons/profile.svg',
      "active": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Header
          Positioned(
            top: 56,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to profile page when avatar is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F8),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18.5,
                          backgroundColor: Color(0xFFFEE1E8),
                          child: SvgPicture.asset(
                            "assets/icons/avatar.svg",
                            width: 25,
                            height: 25,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Sujith",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xFFE4E6E9),
                  radius: 22,
                  child: SvgPicture.asset(
                    "assets/icons/history.svg",
                    width: 40,
                    height: 40,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                )
              ],
            ),
          ),

          // Heading
          Positioned(
            top: 124,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 34, fontFamily: 'ADLaM_Display'),
                    children: [
                      TextSpan(
                          text: "GoAround the",
                          style: TextStyle(
                              color: Color(0xFF2D323D),
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: "\nBeautiful ",
                          style: TextStyle(
                              color: Color(0xFF1B1E28),
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: "world!",
                          style: TextStyle(
                              color: Color(0xFFFF7029),
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 120.0),
                  child: SvgPicture.asset("assets/icons/vector-2524.svg",
                      width: 99),
                ),
              ],
            ),
          ),

          // Destination cards
          Positioned(
            top: 250, // Adjusted from 270 to 250 to move it up
            left: 0,
            right: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Best Destination",
                        style: TextStyle(
                          fontFamily: 'ADLaM_Display',
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontFamily: 'ADLaM_Display',
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20),
                    itemCount: destinations.length,
                    separatorBuilder: (_, __) => SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final destination = destinations[index];
                      return DestinationCard(destination: destination);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // First two navigation items
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      navItems[0]['iconAsset'] as String,
                      width: 24,
                      height: 24,
                      color: navItems[0]["active"]
                          ? Color(0xFF0D6EFD)
                          : Color(0xFF7C838D),
                    ),
                    SizedBox(height: 4),
                    Text(
                      navItems[0]["name"],
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: navItems[0]["active"]
                            ? Color(0xFF0D6EFD)
                            : Color(0xFF7C838D),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      navItems[1]["icon"],
                      color: navItems[1]["active"]
                          ? Color(0xFF0D6EFD)
                          : Color(0xFF7C838D),
                      size: 24,
                    ),
                    SizedBox(height: 4),
                    Text(
                      navItems[1]["name"],
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: navItems[1]["active"]
                            ? Color(0xFF0D6EFD)
                            : Color(0xFF7C838D),
                      ),
                    )
                  ],
                ),
                // Empty space for search button
                SizedBox(width: 24),
                // Last two navigation items
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      navItems[2]['iconAsset'] as String,
                      width: 24,
                      height: 24,
                      color: navItems[2]["active"]
                          ? Color(0xFF0D6EFD)
                          : Color(0xFF7C838D),
                    ),
                    SizedBox(height: 4),
                    Text(
                      navItems[2]["name"],
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: navItems[2]["active"]
                            ? Color(0xFF0D6EFD)
                            : Color(0xFF7C838D),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to profile page when profile tab is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        navItems[3]['iconAsset'] as String,
                        width: 24,
                        height: 24,
                        color: navItems[3]["active"]
                            ? Color(0xFF0D6EFD)
                            : Color(0xFF7C838D),
                      ),
                      SizedBox(height: 4),
                      Text(
                        navItems[3]["name"],
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: navItems[3]["active"]
                              ? Color(0xFF0D6EFD)
                              : Color(0xFF7C838D),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            // Search button
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF0D6EFD),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF0D6EFD).withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Map<String, dynamic> destination;

  const DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail.dart when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPage(destination: destination)),
        );
      },
      child: Container(
        width: 268,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F8),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Color(0x1FB3BCC8),
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    destination['image'],
                    height: 286,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (destination['hasBookmark'] == true)
                  Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/icons/bookmark.png',
                          width: 16,
                          height: 16,
                        ),
                      )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        destination['name'],
                        style: TextStyle(
                          fontFamily: 'ADLaM_Display',
                          fontSize: 18,
                          color: Color(0xFF2D323D),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text(destination['rating']),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_pin,
                              size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(destination['state']),
                        ],
                      ),
                      if (destination['hasPeople'] == true)
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey[200],
                              child: SvgPicture.asset(
                                "assets/icons/avatar.svg",
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: -8),
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey[200],
                              child: SvgPicture.asset(
                                "assets/icons/avatar.svg",
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 4),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Color(0xFFE4E6E9),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child:
                                  Text("+50", style: TextStyle(fontSize: 11)),
                            )
                          ],
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
