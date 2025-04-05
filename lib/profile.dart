import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'edit.dart';

class ProfileScreen extends StatelessWidget {
  final Map<String, dynamic> userData = {
    'name': 'Sujith Gopi',
    'email': 'sujithgopi740@gmail.com',
    'profileImage': 'assets/icons/avatar.svg',
    'stats': <Map<String, dynamic>>[
      {'label': 'Reward Points', 'value': 0, 'fontWeight': FontWeight.w600},
      {'label': 'Travel Trips', 'value': 0, 'fontWeight': FontWeight.w600},
      {'label': 'Bucket List', 'value': 0, 'fontWeight': FontWeight.w600},
    ],
  };

  final List<Map<String, dynamic>> menuItems = [
    {
      'iconAsset': 'assets/icons/profile.svg',
      'label': 'Profile',
      'fontWeight': FontWeight.w600,
      'color': Colors.black,
    },
    {
      'iconAsset': 'assets/icons/bookmark.svg',
      'label': 'Bookmarked',
      'fontWeight': FontWeight.w600,
      'color': Colors.black,
    },
    {
      'iconAsset': 'assets/icons/history.svg',
      'label': 'Previous Trips',
      'fontWeight': FontWeight.w600,
      'color': Colors.black,
    },
    {
      'iconAsset': 'assets/icons/settings.svg',
      'label': 'Settings',
      'fontWeight': FontWeight.w600,
      'color': Colors.black,
    },
    {
      'iconAsset': 'assets/icons/version.svg',
      'label': 'Version',
      'color': Colors.black,
      'fontWeight': FontWeight.w600,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.chevron_left,
                              color: Color(0xFF7C838D)),
                        ),
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/Edit.svg',
                              width: 24,
                              height: 24,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Profile Info
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFFFFDEE6),
                  child: ClipOval(
                    child: SvgPicture.asset(
                      userData['profileImage'] as String,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  userData['name'] as String,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  userData['email'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 24),

                // Stats Card
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('Reward Points', '0'),
                      _buildDivider(),
                      _buildStatItem('Travel Trips', '0'),
                      _buildDivider(),
                      _buildStatItem('Bucket List', '0'),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // Menu List
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: menuItems.length,
                    separatorBuilder: (context, index) => Divider(height: 1),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return ListTile(
                        leading: item.containsKey('icon')
                            ? Icon(item['icon'] as IconData,
                                color: Colors.grey, size: 24)
                            : SvgPicture.asset(
                                item['iconAsset'] as String,
                                width: 24,
                                height: 24,
                                color: Colors.grey,
                              ),
                        title: Text(
                          item['label'] as String,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        trailing: Icon(Icons.chevron_right, color: Colors.grey),
                        onTap: () {
                          // Handle navigation based on menu item
                          switch (item['label']) {
                            case 'Profile':
                              // Stay on current page
                              break;
                            case 'Bookmarked':
                              Navigator.pushNamed(context, '/bookmarks');
                              break;
                            case 'Previous Trips':
                              Navigator.pushNamed(context, '/trips');
                              break;
                            case 'Settings':
                              Navigator.pushNamed(context, '/settings');
                              break;
                            case 'Version':
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('App Version'),
                                  content: Text('Version 1.0.0'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                              break;
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      color: Colors.grey.withOpacity(0.3),
    );
  }
  // Remove this misplaced code
  // IconButton(
  //   icon: const Icon(Icons.edit),
  //   onPressed: () {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const EditProfileScreen()),
  //     );
  //   },
  // ),
}
