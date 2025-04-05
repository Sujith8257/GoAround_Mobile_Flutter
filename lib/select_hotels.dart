import 'package:flutter/material.dart';

class HotelsScreen extends StatelessWidget {
  final List<Map<String, String>> hotels = [
    {
      'id': '1',
      'name': 'Hotel 01',
      'location': 'Tirupati',
      'image': 'assets/tri-3.png',
    },
    {
      'id': '2',
      'name': 'Hotel 02',
      'location': 'Av Damero, Mexico',
      'image': 'assets/image-3.png',
    },
    {
      'id': '3',
      'name': 'Hotel 03',
      'location': 'Tirupati',
      'image': 'assets/image-5.png',
    },
    {
      'id': '4',
      'name': 'Hotel 04',
      'location': 'Tirupati',
      'image': 'assets/image-4.png',
    },
    {
      'id': '5',
      'name': 'Hotel 05',
      'location': 'Tirupati',
      'image': 'assets/rectangle-838.png',
    },
    {
      'id': '6',
      'name': 'Hotel 06',
      'location': 'Tirupati',
      'image': 'assets/rectangle-839.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left,
                          color: Color(0xFF2A2F3B)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Hotel's in Tirupati",
                    style: TextStyle(
                      fontFamily: 'ADLaM Display',
                      fontSize: 18,
                      color: Color(0xFF2A2F3B),
                    ),
                  ),
                ],
              ),
            ),

            // Filter section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Dropdown (not functional, static "All")
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2F3B),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "All",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),

                  // Next button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEFEFEF),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black),
                      ),
                      textStyle: const TextStyle(fontSize: 13.3),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right, size: 16),
                    label: const Text("Next"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Hotel cards grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: hotels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.82,
                  ),
                  itemBuilder: (context, index) {
                    final hotel = hotels[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1FB3BCC8),
                            blurRadius: 16,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Image & Heart Icon
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  hotel['image'] ?? '',
                                  width: double.infinity,
                                  height: 124,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(Icons.favorite_border,
                                      size: 14, color: Color(0xFF7C838D)),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Hotel Name & Location
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hotel['name'] ?? '',
                                  style: const TextStyle(
                                    fontFamily: 'ADLaM Display',
                                    fontSize: 14,
                                    color: Color(0xFF2A2F3B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        size: 14, color: Color(0xFF7C838D)),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        hotel['location'] ?? '',
                                        style: const TextStyle(
                                          fontFamily: 'ADLaM Display',
                                          fontSize: 12,
                                          color: Color(0xFF9EA6B3),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
