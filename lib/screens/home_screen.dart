import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'medicine_analyser_screen.dart';
import 'prescription_analyser_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color primaryGreen = Color(0xFF0B6E4F);
  static const Color deepGreen = Color(0xFF083D2E);
  static const Color accentGreen = Color(0xFF4CD787);
  static const Color paleGreen = Color(0xFFE6F5EC);
  static const Color mintGreen = Color(0xFFB7E4C7);

  String _selectedItem = 'Dashboard';

  // ============================================================
  // TIME GREETING
  // ============================================================

  ({String text, IconData icon}) get _greeting {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return (
        text: 'Good Morning!',
        icon: Icons.wb_sunny_rounded,
      );
    } else if (hour < 17) {
      return (
        text: 'Good Afternoon!',
        icon: Icons.wb_cloudy_rounded,
      );
    } else {
      return (
        text: 'Good Evening!',
        icon: Icons.nightlight_round,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final greeting = _greeting;

    return Scaffold(
      backgroundColor: paleGreen,

      // ==========================================================
      // APP BAR
      // ==========================================================

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),

        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                primaryGreen,
                deepGreen,
              ],
            ),
          ),

          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,

            // MENU
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),

            // TITLE
            title: const Row(
              children: [
                Icon(
                  Icons.eco_rounded,
                  color: accentGreen,
                ),
                SizedBox(width: 8),
                Text(
                  'Curevia',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            // PROFILE
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),

                child: InkWell(
                  borderRadius: BorderRadius.circular(30),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProfileScreen(),
                      ),
                    );
                  },

                  child: Container(
                    padding: const EdgeInsets.all(2),

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: accentGreen,
                        width: 1.5,
                      ),
                    ),

                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,

                      child: Icon(
                        Icons.person,
                        size: 17,
                        color: primaryGreen,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ==========================================================
      // SIDE MENU
      // ==========================================================

      drawer: Drawer(
        backgroundColor: deepGreen,
        width: 290,

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              // HEADER
              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 22,
                ),

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryGreen,
                      deepGreen,
                    ],
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: accentGreen,
                          width: 2,
                        ),
                      ),

                      child: const CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,

                        child: Icon(
                          Icons.person,
                          size: 34,
                          color: primaryGreen,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'Curevia',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      'Your Healthcare Companion',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                  ],
                ),
              ),

              // DIVIDER
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: accentGreen.withOpacity(0.3),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                      ),

                      child: Icon(
                        Icons.eco,
                        size: 14,
                        color: accentGreen,
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: 1,
                        color: accentGreen.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
              ),

              // MENU ITEMS
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),

                  children: [
                    _menuItem(
                      context,
                      icon: Icons.person,
                      title: 'Profile',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.dashboard,
                      title: 'Dashboard',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.badge,
                      title: 'Healthcare ID',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.family_restroom,
                      title: 'Family ID',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.folder_shared,
                      title: 'Medical Record',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.description,
                      title: 'Prescription Analyser',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.medication,
                      title: 'Medicine Analyser',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.bloodtype,
                      title: 'Blood Donation',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.medical_services,
                      title: 'Medical Assistant',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.emergency,
                      title: 'Emergency',
                    ),

                    _menuItem(
                      context,
                      icon: Icons.smart_toy,
                      title: 'AI Assistant',
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),

                child: Text(
                  'v1.0 • Stay Healthy 🌿',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // ==========================================================
      // DASHBOARD BODY
      // ==========================================================

      body: Stack(
        children: [
          // Decorative circle
          Positioned(
            top: -50,
            right: -40,

            child: Container(
              height: 140,
              width: 140,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: mintGreen.withOpacity(0.4),
              ),
            ),
          ),

          Positioned(
            top: 90,
            left: -60,

            child: Container(
              height: 110,
              width: 110,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: mintGreen.withOpacity(0.3),
              ),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              20,
              22,
              20,
              100,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // ==================================================
                // GREETING
                // ==================================================

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),

                      decoration: BoxDecoration(
                        color: accentGreen.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),

                      child: Icon(
                        greeting.icon,
                        color: primaryGreen,
                        size: 22,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Text(
                      greeting.text,

                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: deepGreen,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                const Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                const SizedBox(height: 25),

                // ==================================================
                // HEALTHCARE ID
                // ==================================================

                _healthcareIdCard(),

                const SizedBox(height: 22),

                // ==================================================
                // HEALTH TIP
                // ==================================================

                _healthTipCard(),

                const SizedBox(height: 28),

                // ==================================================
                // TODAY'S MEDICINES
                // ==================================================

                const Text(
                  "Today's Medicines",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: deepGreen,
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    Expanded(
                      child: _medicineTimeCard(
                        medicine: 'Medicine 1',
                        time: '10:00 AM',
                        taken: true,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: _medicineTimeCard(
                        medicine: 'Medicine 2',
                        time: '2:00 PM',
                        taken: false,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // ==================================================
                // QUICK ACCESS
                // ==================================================

                const Text(
                  'Quick Access',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: deepGreen,
                  ),
                ),

                const SizedBox(height: 14),

                // ==================================================
                // MEDICAL RECORDS + PRESCRIPTION ANALYSER
                // ==================================================

                Row(
                  children: [
                    Expanded(
                      child: _featureCard(
                        icon: Icons.folder_shared,
                        title: 'Medical\nRecords',

                        onTap: () {
                          _showMessage(
                            context,
                            'Medical Records selected',
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: _featureCard(
                        icon: Icons.description,
                        title: 'Prescription\nAnalyser',

                        // ========================================
                        // OPEN PRESCRIPTION ANALYSER
                        // ========================================

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PrescriptionAnalyserScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                // ==================================================
                // MEDICINE ANALYSER + BLOOD DONATION
                // ==================================================

                Row(
                  children: [
                    Expanded(
                      child: _featureCard(
                        icon: Icons.medication,
                        title: 'Medicine\nAnalyser',

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MedicineAnalyserScreen(),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: _featureCard(
                        icon: Icons.bloodtype,
                        title: 'Blood\nDonation',

                        onTap: () {
                          _showMessage(
                            context,
                            'Blood Donation selected',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      // ==========================================================
      // AI BUTTON
      // ==========================================================

      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,

          gradient: const LinearGradient(
            colors: [
              accentGreen,
              primaryGreen,
            ],

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          boxShadow: [
            BoxShadow(
              color: primaryGreen.withOpacity(0.4),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,

          onPressed: () {
            _showMessage(
              context,
              'AI Assistant selected',
            );
          },

          child: const Icon(
            Icons.smart_toy,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HEALTHCARE ID CARD
  // ============================================================

  Widget _healthcareIdCard() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            primaryGreen,
            deepGreen,
          ],
        ),

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: primaryGreen.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.badge_outlined,
                  color: accentGreen,
                  size: 28,
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Text(
                  'Healthcare ID',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const Icon(
                Icons.qr_code_rounded,
                color: Colors.white70,
                size: 25,
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            'Your digital healthcare identity',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              _idChip(
                icon: Icons.bloodtype,
                label: 'O+',
              ),

              const SizedBox(width: 10),

              _idChip(
                icon: Icons.tag,
                label: 'CV-2026-0417',
              ),
            ],
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              onPressed: () {
                _showMessage(
                  context,
                  'Healthcare ID selected',
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: accentGreen,
                foregroundColor: deepGreen,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),

              child: const Text(
                'View Healthcare ID',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ID CHIP
  // ============================================================

  Widget _idChip({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          Icon(
            icon,
            size: 13,
            color: accentGreen,
          ),

          const SizedBox(width: 5),

          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // HEALTH TIP
  // ============================================================

  Widget _healthTipCard() {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: mintGreen.withOpacity(0.5),
        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: accentGreen.withOpacity(0.4),
        ),
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),

            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.lightbulb_outline,
              color: primaryGreen,
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  'Health Tip of the Day',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: deepGreen,
                  ),
                ),

                SizedBox(height: 3),

                Text(
                  'Drink enough water throughout the day to stay hydrated.',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MEDICINE TIME CARD
  // ============================================================

  Widget _medicineTimeCard({
    required String medicine,
    required String time,
    required bool taken,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [
              const Icon(
                Icons.medication,
                color: primaryGreen,
                size: 28,
              ),

              Icon(
                taken
                    ? Icons.check_circle
                    : Icons.schedule,
                color: taken
                    ? primaryGreen
                    : Colors.grey,
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            time,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: deepGreen,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            medicine,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FEATURE CARD
  // ============================================================

  Widget _featureCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,

      borderRadius: BorderRadius.circular(20),

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),

        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 12,
          ),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

            border: Border.all(
              color: primaryGreen.withOpacity(0.08),
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                padding: const EdgeInsets.all(12),

                decoration: const BoxDecoration(
                  color: paleGreen,
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  icon,
                  size: 32,
                  color: primaryGreen,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                title,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: deepGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MENU ITEM
  // ============================================================

  Widget _menuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
  }) {
    final bool isSelected =
        _selectedItem == title;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(16),

        onTap: () {
          setState(() {
            _selectedItem = title;
          });

          Navigator.pop(context);

          // PROFILE
          if (title == 'Profile') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ProfileScreen(),
              ),
            );
            return;
          }

          // DASHBOARD
          if (title == 'Dashboard') {
            return;
          }

          // PRESCRIPTION ANALYSER
          if (title == 'Prescription Analyser') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const PrescriptionAnalyserScreen(),
              ),
            );
            return;
          }

          // MEDICINE ANALYSER
          if (title == 'Medicine Analyser') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const MedicineAnalyserScreen(),
              ),
            );
            return;
          }

          _showMessage(
            context,
            '$title selected',
          );
        },

        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),

          decoration: BoxDecoration(
            color: isSelected
                ? accentGreen.withOpacity(0.18)
                : Colors.transparent,

            borderRadius: BorderRadius.circular(16),
          ),

          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: accentGreen,
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),

              if (isSelected)
                const Icon(
                  Icons.chevron_right,
                  color: accentGreen,
                  size: 18,
                ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // MESSAGE
  // ============================================================

  void _showMessage(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: primaryGreen,
      ),
    );
  }
}