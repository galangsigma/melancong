// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';
import 'package:fluterproject/global.dart' as global;
import 'package:fluterproject/widgets/bottom_nav_bar.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  String selectedNavIndex = '/events';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> event =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = colorPink;
    final bgColor = isDark ? colorBlack : colorWhite;
    final textColor = isDark ? colorWhite : colorBlack;

    return ValueListenableBuilder(
      valueListenable: global.rsvpList,
      builder: (context, value, child) => buildScaffold(
        bgColor,
        event,
        isDark,
        primaryColor,
        textColor,
        context,
        value,
      ),
    );
  }

  Scaffold buildScaffold(
    Color bgColor,
    Map<String, dynamic> event,
    bool isDark,
    Color primaryColor,
    Color textColor,
    BuildContext context,
    Set<Map<String, dynamic>> value,
  ) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Image with Buttons
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(event['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? primaryColor.withValues(alpha: 0.2)
                                      : primaryColor.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: isDark ? Colors.white : textColor,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? primaryColor.withValues(alpha: 0.2)
                                      : primaryColor.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.share,
                                    color: isDark ? Colors.white : textColor,
                                  ),
                                  onPressed: () {
                                    print('Share button pressed');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Event Details
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['title'],
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: primaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              event['date'],
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: primaryColor,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                event['location'],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textColor.withValues(alpha: 0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          event['description'],
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Action Buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: rsvpButton(
                            event,
                            context,
                            primaryColor,
                            value.contains(event),
                            isDark,
                            value,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              print('Add to Calendar pressed');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Added to Calendar!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: primaryColor,
                              backgroundColor: isDark
                                  ? primaryColor.withValues(alpha: 0.2)
                                  : primaryColor.withValues(alpha: 0.1),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            child: const Text(
                              'Add to Calendar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Bottom Navigation
          BottomNavBar(current: selectedNavIndex),
        ],
      ),
    );
  }

  ElevatedButton rsvpButton(
      Map<String, dynamic> event,
      BuildContext context,
      Color primaryColor,
      bool contained,
      bool isDark,
      Set<Map<String, dynamic>> value,
      ) {
    return ElevatedButton(
      onPressed: () {
        print('RSVP button pressed');
        final newRsvpSet = Set<Map<String, dynamic>>.from(value);
        if (contained) {
          newRsvpSet.remove(event);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('RSVP Cancelled!'),
              backgroundColor: Colors.redAccent, // Changed for better user feedback
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          newRsvpSet.add(event);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('RSVP Confirmed!'),
              backgroundColor: Color(0xFFf25aa6),
              duration: Duration(seconds: 2),
            ),
          );
        }
        global.rsvpList.value = newRsvpSet;
      },
      style: contained
          ? ElevatedButton.styleFrom(
        foregroundColor: primaryColor,
        backgroundColor: isDark
            ? primaryColor.withAlpha(51) // Using withAlpha for clarity
            : primaryColor.withAlpha(26),
        padding: const EdgeInsets.symmetric(vertical: 16),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      )
          : ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        elevation: 8,
        shadowColor: primaryColor.withAlpha(77),
      ),
      child: Text(
        contained ? 'Cancel RSVP' : 'RSVP',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

}
