import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedToggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    final transportTypes = ['Train', 'Bus', 'Bike/Car'];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: Container(
          width: 375,
          height: 812,
          color: const Color(0xFFF5F5F5),
          child: Stack(
            children: [
              // Transport Toggle Buttons
              Positioned(
                top: 62,
                left: 37,
                child: Container(
                  width: 300,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ToggleButtons(
                    isSelected: List.generate(
                        transportTypes.length, (i) => i == selectedToggleIndex),
                    onPressed: (index) {
                      setState(() {
                        selectedToggleIndex = index;
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    selectedColor: Colors.black,
                    fillColor: Colors.white,
                    color: Colors.grey,
                    children: transportTypes.map((e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Location Inputs
              Positioned(
                top: 139,
                left: 20,
                child: SizedBox(
                  width: 330,
                  height: 111,
                  child: Stack(
                    children: [
                      _locationButton("From Location", 0),
                      _locationButton("To Location", 67),
                      Positioned(
                        top: 30,
                        left: 269,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/frame-1.png", width: 32),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Date Button
              Positioned(
                top: 271,
                left: 22,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0d6efd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(330, 44),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Select Date",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.calendar_today, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              // Search Bar
              Positioned(
                top: 340,
                left: 85,
                child: Container(
                  width: 200,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A000000),
                        blurRadius: 10,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 13.3,
                              color: Color(0xFF757575),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4e99e9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(57, 35),
                        ),
                        onPressed: () {},
                        child: const Text("Go"),
                      ),
                    ],
                  ),
                ),
              ),

              // Map Image
              Positioned(
                top: 401,
                child: Image.asset(
                  "assets/image-8.png",
                  width: 375,
                  height: 321,
                  fit: BoxFit.cover,
                ),
              ),

              // Bottom Navigation Bar
              Positioned(
                top: 714,
                left: 0,
                child: _buildBottomNav(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _locationButton(String label, double topOffset) {
    return Positioned(
      top: topOffset,
      left: 0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0d6efd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: const Size(330, 44),
          alignment: Alignment.centerLeft,
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'ADLaM_Display',
              fontSize: 16,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      width: 375,
      height: 98,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/rectangle-15.png"),
          fit: BoxFit.fill,
        ),
      ),
      padding: const EdgeInsets.only(top: 14, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomItem("Home", "assets/group-41.png"),
          _bottomItem("Bus", "assets/group.png", active: true),
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFF0d6efd),
            child: const Icon(Icons.search, color: Colors.white),
          ),
          _bottomItem("Purpose", "assets/frame-2.png"),
          _bottomItem("Profile", null, isProfile: true),
        ],
      ),
    );
  }

  Widget _bottomItem(String label, String? iconPath,
      {bool active = false, bool isProfile = false}) {
    Color color = active
        ? const Color(0xFF0d6efd)
        : const Color(0xFF7d848d); // default inactive

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (iconPath != null)
          Image.asset(iconPath, width: 24, height: 24, color: color),
        if (isProfile)
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 16,
                height: 8,
                decoration: BoxDecoration(
                  border: Border.all(color: color, width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
              ),
              Positioned(
                top: -4,
                right: -6,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(color: color, width: 1.5),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'ADLaM_Display',
            fontSize: 12,
            color: color,
          ),
        ),
      ],
    );
  }
}
