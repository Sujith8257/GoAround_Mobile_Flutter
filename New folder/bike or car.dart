import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transportOptions = [
    {"value": "train", "label": "Train"},
    {"value": "bus", "label": "Bus"},
    {"value": "bike-car", "label": "Bike/Car"},
  ];

  final List<Map<String, dynamic>> navigationItems = [
    {"icon": Icons.home, "label": "Home", "active": false},
    {"icon": "assets/group.png", "label": "Bus", "active": true},
    {"icon": Icons.search, "label": "", "active": false, "primary": true},
    {"icon": "assets/frame-1.svg", "label": "Purpose", "active": false},
    {"icon": Icons.person, "label": "Profile", "active": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Stack(
        children: [
          // Status Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("9:41",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'ADLaM_Display',
                          color: Color(0xff7c838d),
                        )),
                    Row(
                      children: [
                        SvgPicture.asset("assets/cellular-connection.svg",
                            width: 16),
                        SizedBox(width: 5),
                        SvgPicture.asset("assets/wifi.svg", width: 16),
                        SizedBox(width: 5),
                        SvgPicture.asset("assets/cap.svg", width: 22),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // Transport Toggle
          Positioned(
            top: 70,
            left: 37,
            right: 37,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xffeeeeee),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: transportOptions.map((option) {
                  final isSelected = option['value'] == 'bike-car';
                  return Container(
                    width: 100,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Color(0xffeeeeee),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      option['label'],
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        fontWeight:
                            isSelected ? FontWeight.normal : FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Location Buttons
          Positioned(
            top: 140,
            left: 22,
            right: 22,
            child: Column(
              children: [
                locationButton("From Location"),
                SizedBox(height: 16),
                Stack(
                  children: [
                    locationButton("To Location"),
                    Positioned(
                      right: 0,
                      top: -10,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/frame.png", width: 32),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          // Search Bar
          Positioned(
            top: 350,
            left: 99,
            child: Container(
              width: 200,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                          hintStyle: TextStyle(
                            fontSize: 13.3,
                            fontFamily: 'Roboto',
                            color: Color(0xff757575),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 57,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0xff4e99e9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text("Go",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.3,
                          fontFamily: 'Roboto',
                        )),
                  )
                ],
              ),
            ),
          ),

          // Background Images
          Positioned(
            top: 422,
            left: 0,
            child: Stack(
              children: [
                Positioned(
                  left: 66,
                  child: Image.asset("assets/image-10.png",
                      width: 309, height: 390, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 14,
                  left: 0,
                  child: Image.asset("assets/image-16.png",
                      width: 229, height: 376),
                ),
              ],
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: 0,
            child: Container(
              width: 375,
              height: 98,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/rectangle-15.svg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  for (int i = 0; i < navigationItems.length; i++)
                    if (navigationItems[i]['primary'] == true)
                      Positioned(
                        top: 8,
                        left: 163,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xffdbe9ff),
                          child: Icon(Icons.search, color: Colors.white),
                        ),
                      )
                    else
                      Positioned(
                        left: [0, 75, 225, 300][i],
                        top: 20,
                        child: Column(
                          children: [
                            navigationItems[i]['icon'] is IconData
                                ? Icon(navigationItems[i]['icon'],
                                    color: navigationItems[i]['active']
                                        ? Color(0xff0d6efd)
                                        : Color(0xff7c838d))
                                : navigationItems[i]['icon']
                                        .toString()
                                        .endsWith(".svg")
                                    ? SvgPicture.asset(
                                        navigationItems[i]['icon'],
                                        width: 24)
                                    : Image.asset(navigationItems[i]['icon'],
                                        width: 24),
                            SizedBox(height: 4),
                            Text(
                              navigationItems[i]['label'],
                              style: TextStyle(
                                fontFamily: 'ADLaM_Display',
                                fontSize: 12,
                                color: navigationItems[i]['active']
                                    ? Color(0xff0d6efd)
                                    : Color(0xff7c838d),
                              ),
                            )
                          ],
                        ),
                      ),

                  // Home Indicator
                  Positioned(
                    bottom: 8,
                    left: (375 - 136) / 2,
                    child: Container(
                      width: 136,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Color(0xff7c838d),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget locationButton(String label) {
    return Container(
      width: 330,
      height: 45,
      decoration: BoxDecoration(
        color: Color(0xff0d6efd),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 26),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'ADLaM_Display',
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
