// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:fluterproject/consts.dart';
import '../widgets/bottom_nav_bar.dart';

// import '../widgets/event_card.dart'; // Jika event_card dibuat

// ==================== PAGE 2: EVENT LIST ====================
class EventListPage extends StatefulWidget {
  const EventListPage({super.key});

  @override
  State<EventListPage> createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  String selectedCategory = 'All';
  int selectedNavIndex = 1; // Index untuk bottom navigation

  final List<Map<String, String>> events = [
    {
      'title': 'Indie Music Fest',
      'date': 'Jul 15 · 7:00 PM',
      'image':
          'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=400',
      'category': 'Music',
    },
    // ... event data lainnya
    {
      'title': 'Food Bazaar',
      'date': 'Jul 16 · 11:00 AM',
      'image':
          'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400',
      'category': 'Food',
    },
    {
      'title': 'Cosplay Convention',
      'date': 'Jul 22 · 9:00 AM',
      'image':
          'https://images.unsplash.com/photo-1531306728370-e2ebd9d7bb99?w=400',
      'category': 'Cosplay',
    },
    {
      'title': 'Marathon',
      'date': 'Jul 23 · 6:00 AM',
      'image':
          'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?w=400',
      'category': 'Running',
    },
  ];

  void _navigateToDetail() {
    print('Navigating to event detail'); // Debug
    Navigator.pushNamed(context, '/event-detail');
  }

  void _onNavTap(int index) {
    // Logic navigasi menggunakan rute yang sudah didaftarkan
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home'); // Pindah ke Home
    } else if (index == 1) {
      // Sudah di Events
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/profile'); // Pindah ke Profile
    }
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
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: bgColor.withValues(alpha: 0.8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40),
                  Text(
                    'Events',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search, color: textColor),
                    onPressed: () {
                      print('Search pressed');
                    },
                  ),
                ],
              ),
            ),

            // Categories
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryChip('All', primaryColor, isDark),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Music', primaryColor, isDark),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Food', primaryColor, isDark),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Cosplay', primaryColor, isDark),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Running', primaryColor, isDark),
                ],
              ),
            ),

            // Content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Featured Event (Dapat diekstrak ke widget terpisah)
                  GestureDetector(
                    onTap: _navigateToDetail,
                    child: Container(
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=400',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Featured',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Cosplay Mania',
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
                                      color: textColor.withValues(alpha: 0.7),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Jul 20 · 10:00 AM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: textColor.withValues(alpha: 0.7),
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
                  ),

                  const SizedBox(height: 24),
                  Text(
                    'Nearby',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Event List (Menggunakan EventCard jika sudah dibuat)
                  ...events.map(
                    (event) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      // Jika EventCard sudah dibuat, panggil EventCard di sini
                      // Contoh: EventCard(event: event, onTap: _navigateToDetail)
                      child: _buildEventListTile(
                        event,
                        surfaceColor,
                        textColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedNavIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildCategoryChip(String label, Color primaryColor, bool isDark) {
    final isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
        print('Category selected: $label');
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
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : primaryColor,
          ),
        ),
      ),
    );
  }

  // Helper widget untuk list event
  Widget _buildEventListTile(
    Map<String, String> event,
    Color surfaceColor,
    Color textColor,
  ) {
    return GestureDetector(
      onTap: _navigateToDetail,
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
