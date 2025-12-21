// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';
import 'package:fluterproject/global.dart' as global;
import 'package:fluterproject/widgets/bottom_nav_bar.dart';

class RsvpPage extends StatefulWidget {
  const RsvpPage({super.key});

  @override
  State<RsvpPage> createState() => _RsvpPageState();
}

class _RsvpPageState extends State<RsvpPage> {
  String? selectedCategory;
  String selectedNavIndex = '/rsvp';

  void _navigateToDetail(event) {
    Navigator.pushNamed(context, '/event-detail', arguments: event);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = colorPink;
    final bgColor = isDark ? colorBlack : colorWhite;
    final surfaceColor = isDark ? colorBlackLighter : Colors.white;
    final textColor = isDark ? colorWhite : colorBlack;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'RSVP List',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),

              buildList(surfaceColor, textColor),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(current: selectedNavIndex),
    );
  }

  Expanded buildList(Color surfaceColor, Color textColor) {
    if (global.rsvpList.isNotEmpty) {
      return Expanded(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ...global.rsvpList.map(
              (event) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildEventListTile(event, surfaceColor, textColor),
              ),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Belum ada event',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  Widget _chipBuilder(
    BuildContext context,
    int index,
    Color primaryColor,
    bool isDark,
  ) {
    {
      String category = interestList.elementAt(index);
      bool isSelected = selectedCategory == category;

      return GestureDetector(
        onTap: () {
          setState(() {
            if (selectedCategory == category) {
              selectedCategory = null;
              isSelected = false;
            } else {
              selectedCategory = category;
              isSelected = true;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? primaryColor
                : isDark
                ? primaryColor.withValues(alpha: 0.2)
                : primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : primaryColor,
            ),
          ),
        ),
      );
    }
  }

  // Helper widget untuk list event
  Widget _buildEventListTile(
    Map<String, dynamic> event,
    Color surfaceColor,
    Color textColor,
  ) {
    return GestureDetector(
      onTap: () => _navigateToDetail(event),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(event['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event['date']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: textColor.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
