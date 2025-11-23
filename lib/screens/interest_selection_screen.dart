// file: lib/screens/interest_selection_screen.dart

import 'package:flutter/material.dart';

// ==================== PAGE 1: INTEREST SELECTION ====================
class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  State<InterestSelectionScreen> createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  // Gunakan Set untuk efisiensi jika jumlah data besar, tapi List juga berfungsi
  final List<String> selectedInterests = ['Music', 'Sports', 'Food'];

  final List<String> allInterests = [
    'Music',
    'Sports',
    'Food',
    'Relaxing',
    'Crowds',
    'Art',
    'Travel',
    'Tech',
    'Fashion',
    'Movies',
    'Gaming',
    'Books',
  ];

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  // FUNGSI YANG DIMODIFIKASI: Menambahkan Loading dan Navigasi ke /home
  void _navigateToEvents() async {
    // 1. Validasi minimal 3 interests sudah terpilih (redundansi, tapi baik)
    if (selectedInterests.length < 3) return;

    // 2. Tampilkan Dialog Loading (untuk simulasi "Mencari acara di sekitar...")
    showDialog(
      context: context,
      barrierDismissible: false, // Tidak bisa ditutup
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: Color(0xFFf25aa6)),
              SizedBox(width: 20),
              Text("Mencari acara di sekitar Anda..."),
            ],
          ),
        );
      },
    );

    // 3. --- LOKASI PANGGILAN API / FUNGSI PENCARIAN NYATA ---
    // Ganti Future.delayed ini dengan fungsi async Anda yang sebenarnya
    // untuk mengambil data acara dari API (menggunakan lokasi dan minat yang dipilih).
    print('Searching events for interests: $selectedInterests...'); // Debug
    await Future.delayed(const Duration(seconds: 2)); // Waktu tunggu simulasi
    // --------------------------------------------------------

    // 4. Tutup Dialog Loading
    if (mounted) {
      Navigator.of(context).pop();
    }

    // 5. Navigasi ke layar utama (/home) setelah proses pencarian selesai
    if (mounted) {
      // Menggunakan pushReplacementNamed agar user tidak bisa kembali ke layar minat
      // Jika layar utama Anda adalah EventListScreen, ganti '/home' dengan '/events'
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFFf25aa6);
    final textColor = isDark
        ? const Color(0xFFf8f6f7)
        : const Color(0xFF1b0d14);
    final subtextColor = isDark
        ? const Color(0xFFf8f6f7).withValues(alpha: 0.7)
        : const Color(0xFF1b0d14).withValues(alpha: 0.7);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: textColor),
                    onPressed: () {
                      // Karena ini adalah layar kedua (setelah SplashScreen),
                      // tombol kembali mungkin tidak diperlukan jika Anda
                      // menggunakan pushReplacementNamed dari SplashScreen.
                      // Jika Anda ingin mengizinkan kembali (misalnya ke SplashScreen),
                      // aktifkan ini: Navigator.pop(context);
                      print(
                        'Back button pressed - Navigation not implemented here',
                      );
                    },
                  ),
                  const Expanded(
                    child: Text(
                      'Interests',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'What are you interested in?',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Select at least 3 interests to personalize your experience.',
                      style: TextStyle(fontSize: 16, color: subtextColor),
                    ),
                    const SizedBox(height: 32),

                    // Interest Grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1.5,
                          ),
                      itemCount: allInterests.length,
                      itemBuilder: (context, index) {
                        final interest = allInterests[index];
                        final isSelected = selectedInterests.contains(interest);

                        return GestureDetector(
                          onTap: () => toggleInterest(interest),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? primaryColor
                                  : isDark
                                  ? const Color(0xFF221019)
                                  : const Color(0xFFf8f6f7),
                              border: Border.all(
                                color: isSelected
                                    ? primaryColor
                                    : isDark
                                    ? primaryColor.withValues(alpha: 0.3)
                                    : primaryColor.withValues(alpha: 0.2),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                interest,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected ? Colors.white : textColor,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),

            // Footer Button
            Container(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: selectedInterests.length >= 3
                      ? _navigateToEvents
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor: primaryColor.withValues(
                      alpha: 0.5,
                    ),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 8,
                    shadowColor: primaryColor.withValues(alpha: 0.3),
                  ),
                  child: Text(
                    selectedInterests.length >= 3
                        ? 'Continue'
                        : 'Select ${3 - selectedInterests.length} more',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
