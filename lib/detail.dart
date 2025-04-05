import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Add this import
import 'select_places.dart'; // Import the SelectPlacesPage

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> destination;

  const DetailsPage({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data for the photo gallery
    final List<Map<String, String>> galleryImages = [
      {
        'src': 'assets/icons/rectangle-15.png',
        'alt': '${destination['name']} attraction 1'
      },
      {
        'src': 'assets/icons/rectangle-15.png',
        'alt': '${destination['name']} attraction 2'
      },
      {
        'src': 'assets/icons/rectangle-15.png',
        'alt': '${destination['name']} attraction 3'
      },
      {
        'src': 'assets/icons/rectangle-15.png',
        'alt': '${destination['name']} attraction 4'
      },
      {
        'src': 'assets/icons/rectangle-15.png',
        'alt': '${destination['name']} attraction 5'
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Header Image - using the temple image from the destination
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              destination['image'],
              height: 400, // Increased from 350 to 400
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Navigation Controls
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Replace the back button with SVG
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/back.svg',
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                _buildIconButton(
                  context,
                  Icons.bookmark_border,
                  () {
                    // Bookmark action
                  },
                ),
              ],
            ),
          ),
          // Details Card - Matching the rounded white card in the image
          Positioned(
            top: 370, // Adjusted from 320 to 370 to match the larger image
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Location
                      Text(
                        destination['name'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        destination['state'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 16),

                      // Location and Rating Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                destination['state'],
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              SizedBox(width: 4),
                              Text(
                                destination['rating'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Text(
                                '(2498)',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      // Photo Gallery - Horizontal row of small images
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: galleryImages.map((image) {
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(image['src']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      SizedBox(height: 20),

                      // About Section
                      Text(
                        'About Destination',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontFamily: 'Poppins',
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Tirupati is a famous pilgrimage city in the Indian state of Andhra Pradesh. It is best known for the Sri Venkateswara Temple, located on the Tirumala Hills, which is one of the richest and most visited Hindu temples in the world. ',
                            ),
                            TextSpan(
                              text: 'Read More',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),

                      // CTA Button - Blue button at the bottom
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to SelectPlacesPage when "Plan a Trip?" is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectPlacesPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF0D6EFD),
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Plan a Trip ?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
      BuildContext context, IconData icon, VoidCallback onPressed) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 20),
        onPressed: onPressed,
      ),
    );
  }
}
