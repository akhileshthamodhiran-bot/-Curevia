import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emergencyController =
      TextEditingController();

  String? selectedGender;
  String? selectedBloodGroup;
  DateTime? selectedDate;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    emergencyController.dispose();
    super.dispose();
  }

  // Date picker
  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // Save profile
  void saveProfile() {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your full name'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved successfully!'),
        backgroundColor: Color(0xFF007F5F),
      ),
    );
  }

  // Common input decoration
  InputDecoration inputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: const Color(0xFF008060),
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xFF00A878),
          width: 2,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color darkGreen = Color(0xFF004D40);
    const Color mainGreen = Color(0xFF007F5F);
    const Color lightGreen = Color(0xFFE8F5EF);

    return Scaffold(
      backgroundColor: lightGreen,

      // TOP APP BAR
      appBar: AppBar(
        backgroundColor: mainGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // IMPORTANT:
      // SingleChildScrollView allows all fields to appear
      // even when the screen is small.
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================
            // PROFILE ICON
            // ==========================

            Center(
              child: Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: darkGreen,
                  border: Border.all(
                    color: const Color(0xFF43E08A),
                    width: 4,
                  ),
                ),
                child: const Icon(
                  Icons.person,
                  size: 70,
                  color: Color(0xFF43E08A),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ==========================
            // TITLE
            // ==========================

            const Center(
              child: Text(
                'Profile Details',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Center(
              child: Text(
                'Enter your personal details',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==========================
            // FULL NAME
            // ==========================

            const Text(
              'Full Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: nameController,
              textCapitalization: TextCapitalization.words,
              decoration: inputDecoration(
                hint: 'Enter your name',
                icon: Icons.person_outline,
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // DATE OF BIRTH
            // ==========================

            const Text(
              'Date of Birth',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: selectDate,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: mainGreen,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      selectedDate == null
                          ? 'Select your date of birth'
                          : '${selectedDate!.day.toString().padLeft(2, '0')}/'
                              '${selectedDate!.month.toString().padLeft(2, '0')}/'
                              '${selectedDate!.year}',
                      style: TextStyle(
                        fontSize: 16,
                        color: selectedDate == null
                            ? Colors.grey
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // GENDER
            // ==========================

            const Text(
              'Gender',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: inputDecoration(
                hint: 'Select gender',
                icon: Icons.wc,
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Male',
                  child: Text('Male'),
                ),
                DropdownMenuItem(
                  value: 'Female',
                  child: Text('Female'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // ==========================
            // BLOOD GROUP
            // ==========================

            const Text(
              'Blood Group',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: selectedBloodGroup,
              decoration: inputDecoration(
                hint: 'Select blood group',
                icon: Icons.bloodtype_outlined,
              ),
              items: const [
                DropdownMenuItem(
                  value: 'A+',
                  child: Text('A+'),
                ),
                DropdownMenuItem(
                  value: 'A-',
                  child: Text('A-'),
                ),
                DropdownMenuItem(
                  value: 'B+',
                  child: Text('B+'),
                ),
                DropdownMenuItem(
                  value: 'B-',
                  child: Text('B-'),
                ),
                DropdownMenuItem(
                  value: 'AB+',
                  child: Text('AB+'),
                ),
                DropdownMenuItem(
                  value: 'AB-',
                  child: Text('AB-'),
                ),
                DropdownMenuItem(
                  value: 'O+',
                  child: Text('O+'),
                ),
                DropdownMenuItem(
                  value: 'O-',
                  child: Text('O-'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedBloodGroup = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // ==========================
            // PHONE NUMBER
            // ==========================

            const Text(
              'Phone Number',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: inputDecoration(
                hint: 'Enter your phone number',
                icon: Icons.phone_outlined,
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // EMAIL
            // ==========================

            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration(
                hint: 'Enter your email',
                icon: Icons.email_outlined,
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // ADDRESS
            // ==========================

            const Text(
              'Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: addressController,
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
              decoration: inputDecoration(
                hint: 'Enter your address',
                icon: Icons.location_on_outlined,
              ),
            ),

            const SizedBox(height: 20),

            // ==========================
            // EMERGENCY CONTACT
            // ==========================

            const Text(
              'Emergency Contact',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: darkGreen,
              ),
            ),

            const SizedBox(height: 8),

            TextFormField(
              controller: emergencyController,
              keyboardType: TextInputType.phone,
              decoration: inputDecoration(
                hint: 'Enter emergency contact number',
                icon: Icons.emergency_outlined,
              ),
            ),

            const SizedBox(height: 30),

            // ==========================
            // SAVE PROFILE BUTTON
            // ==========================

            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  foregroundColor: Colors.white,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'SAVE PROFILE',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}