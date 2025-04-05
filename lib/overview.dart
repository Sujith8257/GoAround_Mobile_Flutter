import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> destination;
  
  const DetailsPage({Key? key, required this.destination}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // Data for the photo gallery
    final List<Map<String, String>> galleryImages = [
      {'src': 'assets/rectangle-822.png', 'alt': '${destination['name']} attraction 1'},
      {'src': 'assets/rectangle-823.png', 'alt': '${destination['name']} attraction 2'},
      {'src': 'assets/rectangle-824.png', 'alt': '${destination['name']} attraction 3'},
    ];
    
    return Scaffold(
      body: Stack(
        children: [
          // Header Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/tri-2.png', // Make sure this asset exists
              height: 424,
              fit: BoxFit.cover,
            ),
          ),
          // Navigation Controls
          Positioned(
            top: 56,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconButton(
                  context,
                  Icons.arrow_back,
                  () => Navigator.pop(context),
                ),
                Text(
                  'Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
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
          // Details Card
          Positioned(
            top: 351,
            left: 0,
            right: 0,
            child: Container(
              height: 461,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/rectangle-14.png'), // Make sure this asset exists
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Drag Handle
                    Container(
                      width: 36,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                    SizedBox(height: 29),
                    // Title and Location
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destination['name'],
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          destination['state'],
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  'Andhra Pradesh',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange),
                                SizedBox(width: 4),
                                Text(
                                  '4.7',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '(2498)',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    // Photo Gallery
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: galleryImages.map((image) {
                        return _buildGalleryImage(image);
                      }).toList(),
                    ),
                    SizedBox(height: 24),
                    // About Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Destination',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Tirupati is a famous pilgrimage city in the Indian state of Andhra Pradesh. It is best known for the Sri Venkateswara Temple, located on the Tirumala Hills, which is one of the richest and most visited Hindu temples in the world. ',
                              ),
                              TextSpan(
                                text: 'Read More',
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    // CTA Button
                    ElevatedButton(
                      onPressed: () {
                        // Plan a Trip action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange, // Changed from primary
                        foregroundColor: Colors.white, // Changed from onPrimary
                        minimumSize: Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Plan a Trip ?',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
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
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(22),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildGalleryImage(Map<String, String> image) {
    return Stack(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image['src']!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        if (image.containsKey('overlayText'))
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                image['overlayText']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}