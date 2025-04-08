import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hotel {
  final int id;
  final String name;
  final String location;
  final String image;

  Hotel({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
  });
}

final List<Hotel> hotels = [
  Hotel(id: 1, name: "Hotel 01", location: "Tirupati", image: "assets/tri-3.png"),
  Hotel(id: 2, name: "Hotel 02", location: "Av Damero, Mexico", image: "assets/image-3.png"),
  Hotel(id: 3, name: "Hotel 03", location: "Tirupati", image: "assets/image-5.png"),
  Hotel(id: 4, name: "Hotel 04", location: "Tirupati", image: "assets/image-4.png"),
  Hotel(id: 5, name: "Hotel 05", location: "Tirupati", image: "assets/rectangle-838.png"),
  Hotel(id: 6, name: "Hotel 06", location: "Tirupati", image: "assets/rectangle-839.png"),
];

class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          // Header
          Positioned(
            top: 56,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Icon(Icons.chevron_left, color: Colors.black),
                ),
                const SizedBox(width: 20),
                Text(
                  "Hotel's in Tirupati",
                  style: GoogleFonts.adlamDisplay(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),

          // Filter + Next Button
          Positioned(
            top: 120,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2a2f3b),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton<String>(
                    value: "All",
                    dropdownColor: const Color(0xFF2a2f3b),
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(value: "All", child: Text("All", style: TextStyle(color: Colors.white))),
                      DropdownMenuItem(value: "Tirupati", child: Text("Tirupati", style: TextStyle(color: Colors.white))),
                    ],
                    onChanged: (_) {},
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEFEFEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black),
                    ),
                    fixedSize: const Size(90, 37),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right, color: Colors.black, size: 18),
                  label: const Text(
                    "Next",
                    style: TextStyle(fontSize: 13.3, color: Colors.black),
                  ),
                )
              ],
            ),
          ),

          // Grid of Hotel Cards
          Positioned(
            top: 170,
            left: 20,
            right: 20,
            bottom: 0,
            child: GridView.builder(
              itemCount: hotels.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 161 / 194,
              ),
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFB3BCC8).withOpacity(0.12),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              hotel.image,
                              height: 124,
                              width: double.infinity,
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
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.favorite_border, size: 16, color: Color(0xFF7c838d)),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              style: GoogleFonts.adlamDisplay(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.location_on, size: 14, color: Color(0xFF7c838d)),
                                const SizedBox(width: 4),
                                Text(
                                  hotel.location,
                                  style: GoogleFonts.adlamDisplay(
                                    fontSize: 12,
                                    color: Color(0xFFa3a3a3),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
