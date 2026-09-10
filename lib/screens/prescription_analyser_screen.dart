import 'package:flutter/material.dart';

class PrescriptionAnalyserScreen extends StatefulWidget {
  const PrescriptionAnalyserScreen({super.key});

  @override
  State<PrescriptionAnalyserScreen> createState() =>
      _PrescriptionAnalyserScreenState();
}

class _PrescriptionAnalyserScreenState
    extends State<PrescriptionAnalyserScreen> {
  bool prescriptionUploaded = false;

  void uploadPrescription() {
    setState(() {
      prescriptionUploaded = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Prescription uploaded successfully.',
        ),
      ),
    );
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
          'Prescription Analyser',
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
            // =====================================================
            // HEADER
            // =====================================================

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
                    Icons.description_outlined,
                    color: accentGreen,
                    size: 44,
                  ),

                  SizedBox(height: 14),

                  Text(
                    'Prescription Analyser',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Upload your prescription and extract medicine details.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // =====================================================
            // UPLOAD SECTION
            // =====================================================

            const Text(
              'Upload Prescription',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: deepGreen,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,

              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(20),

                border: Border.all(
                  color: primaryGreen.withOpacity(0.2),
                ),
              ),

              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: paleGreen,
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.cloud_upload_outlined,
                      size: 42,
                      color: primaryGreen,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Upload your prescription',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: deepGreen,
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    'Take a photo or select an image of your prescription.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton.icon(
                      onPressed: uploadPrescription,

                      icon: const Icon(
                        Icons.upload_file,
                      ),

                      label: const Text(
                        'UPLOAD PRESCRIPTION',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // =====================================================
            // EXTRACTION PROCESS
            // =====================================================

            const Text(
              'How it works',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: deepGreen,
              ),
            ),

            const SizedBox(height: 15),

            _processCard(
              icon: Icons.upload_file,
              number: '1',
              title: 'Upload Prescription',
              description:
                  'Upload a clear photo of your prescription.',
              primaryGreen: primaryGreen,
              paleGreen: paleGreen,
            ),

            const SizedBox(height: 12),

            _processCard(
              icon: Icons.document_scanner_outlined,
              number: '2',
              title: 'Analyse Prescription',
              description:
                  'The system reads the prescription details.',
              primaryGreen: primaryGreen,
              paleGreen: paleGreen,
            ),

            const SizedBox(height: 12),

            _processCard(
              icon: Icons.medication_outlined,
              number: '3',
              title: 'Extract Medicines',
              description:
                  'Medicine name, dosage, timing and duration are identified.',
              primaryGreen: primaryGreen,
              paleGreen: paleGreen,
            ),

            const SizedBox(height: 12),

            _processCard(
              icon: Icons.calendar_month_outlined,
              number: '4',
              title: 'Create Schedule',
              description:
                  'The extracted prescription schedule can be reviewed before reminders are created.',
              primaryGreen: primaryGreen,
              paleGreen: paleGreen,
            ),

            // =====================================================
            // DEMO EXTRACTION RESULT
            // =====================================================

            if (prescriptionUploaded) ...[
              const SizedBox(height: 30),

              const Text(
                'Prescription Details',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: deepGreen,
                ),
              ),

              const SizedBox(height: 15),

              _buildPrescriptionResult(
                primaryGreen,
                deepGreen,
              ),
            ],
          ],
        ),
      ),
    );
  }

  // =============================================================
  // PROCESS CARD
  // =============================================================

  Widget _processCard({
    required IconData icon,
    required String number,
    required String title,
    required String description,
    required Color primaryGreen,
    required Color paleGreen,
  }) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 48,
            height: 48,

            decoration: BoxDecoration(
              color: paleGreen,
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: primaryGreen,
              size: 25,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                    Text(
                      'Step $number',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: primaryGreen,
                      ),
                    ),

                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =============================================================
  // PRESCRIPTION RESULT
  // =============================================================

  Widget _buildPrescriptionResult(
    Color primaryGreen,
    Color deepGreen,
  ) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(
          color: primaryGreen.withOpacity(0.15),
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: primaryGreen,
                size: 28,
              ),

              const SizedBox(width: 10),

              const Expanded(
                child: Text(
                  'Prescription analysed',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Divider(),

          const SizedBox(height: 15),

          _medicineRow(
            'Medicine A',
            '1 tablet',
            '10:00 AM',
          ),

          const SizedBox(height: 14),

          _medicineRow(
            'Medicine B',
            '1 tablet',
            '2:00 PM',
          ),

          const SizedBox(height: 14),

          _medicineRow(
            'Medicine A',
            '1 tablet',
            '8:00 PM',
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(14),

            decoration: BoxDecoration(
              color: const Color(0xFFE6F5EC),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Row(
              children: [
                Icon(
                  Icons.event,
                  color: primaryGreen,
                ),

                const SizedBox(width: 10),

                const Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      Text(
                        'Next Review',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        '15 September 2026',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            height: 50,

            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Prescription details confirmed.',
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),

              child: const Text(
                'CONFIRM PRESCRIPTION',
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

  // =============================================================
  // MEDICINE ROW
  // =============================================================

  Widget _medicineRow(
    String name,
    String dosage,
    String time,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFFF7FBF8),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        children: [
          const Icon(
            Icons.medication,
            color: Color(0xFF0B6E4F),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  dosage,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B6E4F),
            ),
          ),
        ],
      ),
    );
  }
}