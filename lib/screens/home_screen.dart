// import 'package:flutter/material.dart';
// import '../widgets/bottom_nav_bar.dart';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {
      'icon': Icons.music_note,
      'label': 'Music',
      'color': const Color(0xFFFF6B9D),
    },
    {
      'icon': Icons.restaurant,
      'label': 'Food',
      'color': const Color(0xFFFF8F5E),
    },
    {
      'icon': Icons.sports_soccer,
      'label': 'Sports',
      'color': const Color(0xFF6BCB77),
    },
    {'icon': Icons.palette, 'label': 'Art', 'color': const Color(0xFF9D84FF)},
    {'icon': Icons.movie, 'label': 'Movies', 'color': const Color(0xFF4D96FF)},
    {'icon': Icons.flight, 'label': 'Travel', 'color': const Color(0xFFFFB800)},
  ];

  final List<Map<String, String>> popularEvents = [
    {
      'title': 'Summer Music Festival',
      'date': 'Jul 25 · 6:00 PM',
      'location': 'Beach Arena',
      'image':
          'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=400',
      'attendees': '2.5K',
    },
    {
      'title': 'Food Truck Rally',
      'date': 'Jul 28 · 12:00 PM',
      'location': 'Downtown Square',
      'image':
          'https://images.unsplash.com/photo-1565123409695-7b5ef63a2efb?w=400',
      'attendees': '1.8K',
    },
    {
      'title': 'Art Exhibition',
      'date': 'Jul 30 · 10:00 AM',
      'location': 'Modern Gallery',
      'image':
          'https://images.unsplash.com/photo-1536924940846-227afb31e2a5?w=400',
      'attendees': '950',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = const Color(0xFFf25aa6);
    final bgColor = isDark ? colorBlack : colorWhite;
    final surfaceColor = isDark ? const Color(0xFF2d1620) : Colors.white;
    final textColor = isDark ? colorWhite : colorBlack;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello! 👋',
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Explore Events',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search events...',
                            hintStyle: TextStyle(
                              color: textColor.withValues(alpha: 0.5),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: textColor.withValues(alpha: 0.5),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Categories
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/events');
                            },
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Container(
                            width: 80,
                            margin: const EdgeInsets.only(right: 16),
                            child: Column(
                              children: [
                                Container(
                                  width: 64,
                                  height: 64,
                                  decoration: BoxDecoration(
                                    color: (category['color'] as Color)
                                        .withValues(alpha: 0.15),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(
                                    category['icon'] as IconData,
                                    color: category['color'] as Color,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  category['label'] as String,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: textColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Popular Events
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Popular Events',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: popularEvents.length,
                      itemBuilder: (context, index) {
                        final event = popularEvents[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/event-detail');
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: surfaceColor,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Image
                                Stack(
                                  children: [
                                    Container(
                                      height: 180,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                              top: Radius.circular(16),
                                            ),
                                        image: DecorationImage(
                                          image: NetworkImage(event['image']!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 12,
                                      right: 12,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withValues(
                                            alpha: 0.6,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.people,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              event['attendees']!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Details
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event['title']!,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                            color: textColor.withValues(
                                              alpha: 0.6,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            event['date']!,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: textColor.withValues(
                                                alpha: 0.6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: textColor.withValues(
                                              alpha: 0.6,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            event['location']!,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: textColor.withValues(
                                                alpha: 0.6,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(primaryColor, textColor, isDark),
    );
  }

  Widget _buildBottomNav(Color primaryColor, Color textColor, bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? colorBlack.withValues(alpha: 0.9)
            : colorWhite.withValues(alpha: 0.9),
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
    final isSelected = selectedNavIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 1) {
          Navigator.pushNamed(context, '/events');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/profile');
        } else {
          setState(() {
            selectedNavIndex = index;
          });
        }
      },
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
