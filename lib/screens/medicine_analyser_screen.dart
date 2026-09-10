import 'package:flutter/material.dart';

class MedicineAnalyserScreen extends StatefulWidget {
  const MedicineAnalyserScreen({super.key});

  @override
  State<MedicineAnalyserScreen> createState() =>
      _MedicineAnalyserScreenState();
}

class _MedicineAnalyserScreenState
    extends State<MedicineAnalyserScreen> {
  final TextEditingController medicineController =
      TextEditingController();

  bool isSearching = false;
  bool medicineFound = false;

  @override
  void dispose() {
    medicineController.dispose();
    super.dispose();
  }

  void analyseMedicine() {
    if (medicineController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a medicine name'),
        ),
      );
      return;
    }

    setState(() {
      isSearching = true;
      medicineFound = false;
    });

    // Temporary demo result.
    // Later we can connect this to a real medicine database/API.
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;

      setState(() {
        isSearching = false;
        medicineFound = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF0B6E4F);
    const Color deepGreen = Color(0xFF083D2E);
    const Color accentGreen = Color(0xFF4CD787);
    const Color paleGreen = Color(0xFFE6F5EC);

    return Scaffold(
      backgroundColor: paleGreen,

      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Medicine Analyser',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // HEADER
            // =========================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    primaryGreen,
                    deepGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.medication,
                    color: accentGreen,
                    size: 42,
                  ),

                  SizedBox(height: 14),

                  Text(
                    'Medicine Analyser',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Enter a medicine name to view general information.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // =========================
            // SEARCH TITLE
            // =========================

            const Text(
              'Search Medicine',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: deepGreen,
              ),
            ),

            const SizedBox(height: 10),

            // =========================
            // SEARCH FIELD
            // =========================

            TextField(
              controller: medicineController,

              decoration: InputDecoration(
                hintText: 'Enter medicine name',

                prefixIcon: const Icon(
                  Icons.search,
                  color: primaryGreen,
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
                    color: primaryGreen,
                    width: 2,
                  ),
                ),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 16,
                ),
              ),

              onSubmitted: (_) {
                analyseMedicine();
              },
            ),

            const SizedBox(height: 15),

            // =========================
            // ANALYSE BUTTON
            // =========================

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed:
                    isSearching ? null : analyseMedicine,

                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),

                child: isSearching
                    ? const SizedBox(
                        height: 23,
                        width: 23,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        'ANALYSE MEDICINE',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 30),

            // =========================
            // RESULT
            // =========================

            if (medicineFound)
              _buildMedicineResult(
                primaryGreen,
                deepGreen,
                accentGreen,
              ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // MEDICINE RESULT CARD
  // ==========================================================

  Widget _buildMedicineResult(
    Color primaryGreen,
    Color deepGreen,
    Color accentGreen,
  ) {
    final String medicineName =
        medicineController.text.trim();

    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // RESULT HEADER

          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: const Color(0xFFE6F5EC),
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  Icons.medication,
                  color: primaryGreen,
                  size: 30,
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: Text(
                  medicineName,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: deepGreen,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          const Divider(),

          const SizedBox(height: 15),

          _infoSection(
            icon: Icons.info_outline,
            title: 'General Information',
            text:
                'Information about this medicine will be displayed here.',
            color: primaryGreen,
          ),

          const SizedBox(height: 18),

          _infoSection(
            icon: Icons.medical_information_outlined,
            title: 'Common Uses',
            text:
                'The common uses of the medicine will be displayed here.',
            color: primaryGreen,
          ),

          const SizedBox(height: 18),

          _infoSection(
            icon: Icons.warning_amber_rounded,
            title: 'Precautions',
            text:
                'Important precautions and warnings will be displayed here.',
            color: Colors.orange,
          ),

          const SizedBox(height: 22),

          // =========================
          // ADD MEDICINE BUTTON
          // =========================

          SizedBox(
            width: double.infinity,
            height: 52,

            child: OutlinedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Add Medicine feature will be added next.',
                    ),
                  ),
                );
              },

              icon: const Icon(
                Icons.add,
              ),

              label: const Text(
                'ADD MEDICINE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              style: OutlinedButton.styleFrom(
                foregroundColor: primaryGreen,

                side: BorderSide(
                  color: primaryGreen,
                  width: 1.5,
                ),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          // SAFETY NOTE

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
            ),

            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: Colors.orange,
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Text(
                    'Medicine information is for general reference. '
                    'Follow your doctor or pharmacist for medicine and dosage decisions.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // INFORMATION SECTION
  // ==========================================================

  Widget _infoSection({
    required IconData icon,
    required String title,
    required String text,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: color,
          size: 24,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}