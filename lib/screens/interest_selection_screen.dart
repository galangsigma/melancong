// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';

class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  State<InterestSelectionScreen> createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  final Set<String> selectedInterests = {};

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  void _navigateToHome() async {
    if (selectedInterests.length < 3) {
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: colorPink),
              SizedBox(width: 20),
              Text("Mencari acara di sekitar Anda..."),
            ],
          ),
        );
      },
    );

    // TODO: Hilangkan simulasi waktu tunggu
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = colorPink;
    final textColor = isDark ? colorWhite : colorBlackText;
    final subtextColor = textColor.withValues(alpha: 0.7);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            const Text(
              'What are you interested in?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              'Select at least 3 interests to personalize your experience.',
              style: TextStyle(fontSize: 16, color: subtextColor),
            ),
            const SizedBox(height: 32),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: interestList.length,
                itemBuilder: (context, index) {
                  final interest = interestList.elementAt(index);
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
                            ? colorBlack
                            : colorWhite,
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
            ),
            const SizedBox(height: 32),

            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                height: 56.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedInterests.length >= 3
                      ? _navigateToHome
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
