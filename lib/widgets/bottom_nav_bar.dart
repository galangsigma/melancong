// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final Color? overrideBg;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    this.overrideBg,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFFf25aa6);
    final textColor = isDark ? colorWhite : colorBlack;

    return Container(
      decoration: BoxDecoration(
        color:
            overrideBg ??
            (isDark
                ? colorBlack.withValues(alpha: 0.9)
                : colorWhite.withValues(alpha: 0.9)),
        border: Border(
          top: BorderSide(
            color: isDark
                ? primaryColor.withValues(alpha: 0.3)
                : primaryColor.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0, primaryColor, textColor),
              _buildNavItem(
                Icons.confirmation_number,
                'Events',
                1,
                primaryColor,
                textColor,
              ),
              _buildNavItem(
                Icons.person,
                'Profile',
                2,
                primaryColor,
                textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    Color primaryColor,
    Color textColor,
  ) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? primaryColor : textColor.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected
                  ? primaryColor
                  : textColor.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
