import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  // Add a constructor to accept navigation parameters if needed
  const SearchScreen({Key? key}) : super(key: key);

  // Make the destinations list static
  static final List<Map<String, dynamic>> destinations = [
    {
      "id": 1,
      "name": "Tirupati",
      "state": 'Andhra Pradesh',
      "fontWeight": FontWeight.bold,
      "image": "assets/icons/tri.jpg",
      "note": "Book tickets in advance",
      "rating": "4.8",
    },
    {
      'id': '2',
      'name': 'Kanniyakumari',
      'state': 'Tamil Nadu',
      'image': 'assets/icons/kan.jpg',
      'rating': '4.6',
    },
    {
      'id': '3',
      'name': 'Madurai',
      'state': 'Tamil Nadu',
      'image': 'assets/icons/mad.png',
      'rating': '4.5',
    },
    {
      'id': '4',
      'name': 'Araku Valley',
      'state': 'Andhra Pradesh',
      'image': 'assets/icons/ara.png',
      'rating': '4.7',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9), // light white
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              // Header with back button that returns to home
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8E8E8),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          'assets/icons/back.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Search',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF246BFD), // light primary
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F3F5),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 20, color: Colors.grey.shade600),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Places',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.grey.shade500,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 1,
                      color: Colors.grey.shade300,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Icon(Icons.mic, color: Colors.grey.shade600),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Title
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search Places',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Destination Cards - Make them clickable
              Expanded(
                child: GridView.builder(
                  itemCount: destinations.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final place = destinations[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to details page when card is tapped
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: place,
                        );
                      },
                      child: _buildDestinationCard(place),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDestinationCard(Map<String, dynamic> place) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0x1FB3BCC8),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(place['image']!),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 10),
            Text(
              place['name']!,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: Color(0xFF5B5B5B),
              ),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.place, size: 14, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  place['state']!,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            if (place['note'] != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  place['note']!,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    color: Color(0xFF246BFD),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _circularIconButton(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Icon(icon, color: Colors.grey, size: 20),
    );
  }
}
