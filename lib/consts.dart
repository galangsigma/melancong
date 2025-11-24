// Flutter imports:
import 'package:flutter/material.dart';

const Set<String> interestList = {
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
};

const colorBlack = Color(0xFF221019);
const colorWhite = Color(0xFFf8f6f7);
const colorPink = Color(0xFFf25aa6);
const colorBlackLighter = Color(0xFF2d1620);
const colorBlackText = Color(0xFF1b0d14);

final List<Map<String, dynamic>> categories = [
  {
    'label': 'Music',
    'icon': Icons.music_note,
    'color': const Color(0xFFFF6B9D),
  },
  {
    'label': 'Sports',
    'icon': Icons.sports_soccer,
    'color': const Color(0xFF6BCB77),
  },
  {'icon': Icons.restaurant, 'label': 'Food', 'color': const Color(0xFFFF9680)},
  {'icon': Icons.spa, 'label': 'Relaxing', 'color': const Color(0xFF36FFF5)},
  {
    'icon': Icons.people_alt,
    'label': 'Crowds',
    'color': const Color(0xFF2D40FF),
  },
  {'icon': Icons.palette, 'label': 'Art', 'color': const Color(0xFFF34AFF)},
  {'icon': Icons.flight, 'label': 'Travel', 'color': const Color(0xFFFFC744)},
  {'icon': Icons.memory, 'label': 'Tech', 'color': const Color(0xFF89FF7E)},
  {
    'icon': Icons.checkroom,
    'label': 'Fashion',
    'color': const Color(0xFFFFDFA8),
  },
  {'icon': Icons.movie, 'label': 'Movies', 'color': const Color(0xFF4D96FF)},
  {
    'icon': Icons.sports_esports,
    'label': 'Gaming',
    'color': const Color(0xFF9900E5),
  },
  {'icon': Icons.menu_book, 'label': 'Books', 'color': const Color(0xFFB05F07)},
];

final List<Map<String, String>> eventList = [
  {
    'title': 'Summer Music Festival',
    'date': 'Nov 25 · 18:00',
    'location': 'Beach Arena',
    'image':
        'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=500',
    'attendees': '2.5K',
    'category': 'Music',
  },
  {
    'title': 'Food Truck Rally',
    'date': 'Nov 28 · 12:00',
    'location': 'Downtown Square',
    'image':
        'https://images.unsplash.com/photo-1565123409695-7b5ef63a2efb?w=500',
    'attendees': '1.8K',
    'category': 'Food',
  },
  {
    'title': 'Art Exhibition',
    'date': 'Nov 30 · 10:00',
    'location': 'Modern Gallery',
    'image':
        'https://images.unsplash.com/photo-1536924940846-227afb31e2a5?w=500',
    'attendees': '500',
    'category': 'Art',
  },
  {
    'title': 'Bifest',
    'date': 'Nov 25 · 08:00',
    'location': 'Binus',
    'image':
        'https://images.unsplash.com/photo-1448584109583-8f5fe2e61544?w=400',
    'attendees': '1.2K',
    'category': 'Crowds',
  },
];
