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
    'description':
        'Join us for a weekend of live music, food, and fun under the sun. Featuring top artists and local bands, this is the can\'t-miss event of the summer!',
  },
  {
    'title': 'Food Truck Rally',
    'date': 'Nov 28 · 12:00',
    'location': 'Downtown Square',
    'image':
        'https://images.unsplash.com/photo-1565123409695-7b5ef63a2efb?w=500',
    'attendees': '1.8K',
    'category': 'Food',
    'description':
        'Explore a variety of culinary delights from the city\'s best food trucks. A taste adventure for the whole family with live entertainment and seating areas.',
  },
  {
    'title': 'Art Exhibition',
    'date': 'Nov 30 · 10:00',
    'location': 'Modern Gallery',
    'image':
        'https://images.unsplash.com/photo-1536924940846-227afb31e2a5?w=500',
    'attendees': '500',
    'category': 'Art',
    'description':
        'Discover stunning works from emerging and established artists. This exhibition showcases contemporary paintings, sculptures, and interactive installations.',
  },
  {
    'title': 'Tech Innovators Conference',
    'date': 'Dec 02 · 09:00',
    'location': 'Convention Center',
    'image': 'https://images.unsplash.com/photo-1556761175-b413da4baf72?w=500',
    'attendees': '1.2K',
    'category': 'Tech',
    'description':
        'A gathering of the brightest minds in technology. Keynotes, workshops, and networking opportunities for all tech enthusiasts.',
  },
  {
    'title': 'Yoga and Meditation Retreat',
    'date': 'Dec 05 · 08:00',
    'location': 'Serenity Gardens',
    'image': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=500',
    'attendees': '300',
    'category': 'Relaxing',
    'description':
        'A full day dedicated to mindfulness and well-being. Join experienced instructors for guided yoga sessions, meditation, and wellness workshops in a peaceful environment.',
  },
  {
    'title': 'City Championship Finals',
    'date': 'Dec 07 · 19:30',
    'location': 'National Stadium',
    'image':
        'https://images.unsplash.com/photo-1489944440615-453fc2b6a9a9?w=500',
    'attendees': '15K',
    'category': 'Sports',
    'description':
        'The final showdown! Watch the top two teams battle it out for the city championship title in a thrilling night of soccer.',
  },
  {
    'title': 'Indie Film Festival',
    'date': 'Dec 10 · 17:00',
    'location': 'The Grand Cinema',
    'image':
        'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?W=500',
    'attendees': '850',
    'category': 'Movies',
    'description':
        'Celebrate the art of filmmaking with a showcase of independent films from around the world. Q&A sessions with directors and actors after screenings.',
  },
];
