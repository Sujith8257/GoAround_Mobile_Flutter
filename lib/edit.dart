import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers for each text field
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController locationController;
  late TextEditingController mobileNumberController;
  
  // Gender selection
  String selectedGender = 'Male';
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  // Initial values
  final List<Map<String, dynamic>> formFields = [
    {'id': 'firstName', 'label': 'First Name', 'value': 'Sujith'},
    {'id': 'lastName', 'label': 'Last Name', 'value': 'Gopi'},
    {'id': 'gender', 'label': 'Gender', 'value': 'Male', 'type': 'dropdown'},
    {'id': 'location', 'label': 'Location', 'value': 'Nellore'},
    {
      'id': 'mobileNumber',
      'label': 'Mobile Number',
      'value': '00000-00000',
      'prefix': '+91',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with initial values
    firstNameController = TextEditingController(text: formFields[0]['value']);
    lastNameController = TextEditingController(text: formFields[1]['value']);
    locationController = TextEditingController(text: formFields[3]['value']);
    mobileNumberController = TextEditingController(text: formFields[4]['value']);
    selectedGender = formFields[2]['value'];
  }

  @override
  void dispose() {
    // Dispose controllers when widget is removed
    firstNameController.dispose();
    lastNameController.dispose();
    locationController.dispose();
    mobileNumberController.dispose();
    super.dispose();
  }

  // Get controller for a specific field
  TextEditingController _getControllerForField(String id) {
    switch (id) {
      case 'firstName':
        return firstNameController;
      case 'lastName':
        return lastNameController;
      case 'location':
        return locationController;
      case 'mobileNumber':
        return mobileNumberController;
      default:
        return TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Save the updated values
              final updatedData = {
                'firstName': firstNameController.text,
                'lastName': lastNameController.text,
                'gender': selectedGender,
                'location': locationController.text,
                'mobileNumber': mobileNumberController.text,
              };
              
              // You can pass this data back to the previous screen
              Navigator.pop(context, updatedData);
            },
            child: const Text(
              'Done',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Profile Picture
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDEE6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SvgPicture.asset(
                          'assets/icons/avatar.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${firstNameController.text} ${lastNameController.text}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Change Profile Picture',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Form Fields
              ...formFields.map((field) {
                // Handle dropdown field type (Gender)
                if (field['type'] == 'dropdown') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                        child: Text(
                          field['label'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedGender,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue!;
                              });
                            },
                            items: genderOptions
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }
                
                // Regular text fields (existing code)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                      child: Text(
                        field['label'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          if (field.containsKey('prefix'))
                            Text(
                              '${field['prefix']}   ',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          Expanded(
                            child: TextField(
                              controller: _getControllerForField(field['id']),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                              onChanged: (value) {
                                // Update name display in real-time for first/last name
                                if (field['id'] == 'firstName' || field['id'] == 'lastName') {
                                  setState(() {});
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
