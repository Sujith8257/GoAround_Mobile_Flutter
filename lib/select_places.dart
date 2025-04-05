import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goaround/select_hotels.dart'; // Add this import

class Place {
  final int id;
  final String name;
  final String location;
  final String image;
  final bool favorite;

  Place({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.favorite,
  });
}

final List<Place> places = [
  Place(
      id: 1,
      name: "Balaji Temple",
      location: "Tirupati",
      image: "assets/icons/tri.jpg", // Using the correct image path
      favorite: true),
  Place(
      id: 2,
      name: "Japali Teertham",
      location: "Av Damero, Mexico",
      image: "assets/icons/jap.png",
      favorite: true),
  Place(
      id: 3,
      name: "Kapila Theertham",
      location: "Tirupati",
      image: "assets/icons/kap.png",
      favorite: true),
  Place(
      id: 4,
      name: "Talakona Waterfall",
      location: "Tirupati",
      image: "assets/icons/tal.png",
      favorite: true),
  Place(
      id: 5,
      name: "Srivari Mettu",
      location: "Tirupati",
      image: "assets/icons/sri.png",
      favorite: true),
  Place(
      id: 6,
      name: "ISKCON Tirupati",
      location: "Tirupati",
      image: "assets/icons/isk.png",
      favorite: false),
];

// Change from StatelessWidget to StatefulWidget
class SelectPlacesPage extends StatefulWidget {
  const SelectPlacesPage({Key? key}) : super(key: key);

  @override
  State<SelectPlacesPage> createState() => _SelectPlacesPageState();
}

class _SelectPlacesPageState extends State<SelectPlacesPage> {
  // Set to track selected place IDs
  final Set<int> selectedPlaces = {};
  String selectedFilter = 'all'; // Default filter

  // Helper method to get display name for the filter
  String getFilterDisplayName(String filter) {
    switch (filter) {
      case 'historical':
        return 'Historical';
      case 'temples':
        return 'Temples';
      case 'tourist':
        return 'Tourist Attractions';
      case 'adventure':
        return 'Adventure';
      case 'water':
        return 'Water Related';
      case 'all':
      default:
        return 'All';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8), // lightwhite-color
      body: SafeArea(
        child: Column(
          children: [
            // Header with back button and title
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.arrow_back,
                          color: Colors.black54, size: 20),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: const Text(
                        "Place's in Tirupati",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  // Adding an empty SizedBox with the same width as the back button
                  // to ensure the title stays centered
                  SizedBox(width: 36),
                ],
              ),
            ),

            // Filter and Next button row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // All filter button with dropdown
                  PopupMenuButton<String>(
                    offset: const Offset(0, 40),
                    onSelected: (String value) {
                      // Handle filter selection
                      setState(() {
                        // You can add filter logic here
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'all',
                        child: Text('All'),
                      ),
                      const PopupMenuItem(
                        value: 'historical',
                        child: Text('Historical'),
                      ),
                      const PopupMenuItem(
                        value: 'temples',
                        child: Text('Temples'),
                      ),
                      const PopupMenuItem(
                        value: 'tourist',
                        child: Text('Tourist Attractions'),
                      ),
                      const PopupMenuItem(
                        value: 'adventure',
                        child: Text('Adventure'),
                      ),
                      const PopupMenuItem(
                        value: 'water',
                        child: Text('Water Related'),
                      ),
                    ],
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2F3B),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "All",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.keyboard_arrow_down,
                              color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),

                  // Next button
                  // Next button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SelectHotelsPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Next",
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward,
                              color: Color(0xFF333333), size: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Grid of places
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: places.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(place: place),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image with favorite icon
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Image.asset(
                                    place.image,
                                    width: double.infinity,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (place.favorite)
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          // Toggle selection state
                                          if (selectedPlaces
                                              .contains(place.id)) {
                                            selectedPlaces.remove(place.id);
                                          } else {
                                            selectedPlaces.add(place.id);
                                          }
                                        });

                                        // Show a confirmation dialog or perform an action
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                '${place.name} is selected for your trip!'),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          shape: BoxShape.circle,
                                        ),
                                        child: SvgPicture.asset(
                                          selectedPlaces.contains(place.id)
                                              ? 'assets/icons/checkin.svg'
                                              : 'assets/icons/check.svg',
                                          width: 16,
                                          height: 16,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            // Place details
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place.name,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF333333),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Color(0xFF999999),
                                        size: 12,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          place.location,
                                          style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            color: Color(0xFF999999),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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

class DetailPage extends StatelessWidget {
  final Place place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF7C838D),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display place image
            Image.asset(
              place.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7C838D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset("assets/ellipse-884.png", height: 16),
                      const SizedBox(width: 8),
                      Text(
                        place.location,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          color: Color(0xFF9AA1AB),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7C838D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "This is a beautiful place to visit in Tirupati. It offers stunning views and a peaceful atmosphere.",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      color: Color(0xFF9AA1AB),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to PlanTripPage when "Plan a Trip" is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanTripPage(place: place),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Plan a Trip",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

// Placeholder for PlanTripPage
class PlanTripPage extends StatelessWidget {
  final Place place;

  const PlanTripPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan Your Trip"),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF7C838D),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Plan your trip to ${place.name}",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7C838D),
              ),
            ),
            const SizedBox(height: 20),
            // Add your trip planning UI here
            const Text(
              "This is where you would implement your trip planning functionality.",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF9AA1AB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for SelectHotelsPage
class SelectHotelsPage extends StatelessWidget {
  const SelectHotelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Hotels"),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF7C838D),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose hotels for your trip",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF7C838D),
              ),
            ),
            const SizedBox(height: 20),
            // Add your hotel selection UI here
            const Text(
              "This is where you would implement your hotel selection functionality.",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF9AA1AB),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
