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
    'title': 'Acoustic Nights in the Park',
    'category': 'Music',
    'date': 'Jan 10 · 19:00',
    'location': 'Central Park Amphitheater',
    'attendees': '500',
    'description':
        'Experience an intimate evening of unplugged melodies under the open sky, featuring local singer-songwriters and relaxed vibes.',
    'image':
        'https://images.unsplash.com/photo-1674474117688-0aa40d5fd11b?w=600',
  },
  {
    'title': 'Electronic Dance Music Festival',
    'category': 'Music',
    'date': 'Jan 15 · 21:00',
    'location': 'Metropolis Arena',
    'attendees': '25K',
    'description':
        'A high-energy night featuring top international DJs, mesmerizing light shows, and non-stop beats at the city\'s largest arena.',
    'image':
        'https://images.unsplash.com/photo-1722333308657-1a4bfa139fb5?w=600',
  },
  {
    'title': 'Symphony Under the Stars',
    'category': 'Music',
    'date': 'Jan 20 · 20:00',
    'location': 'Botanical Gardens',
    'attendees': '1.2K',
    'description':
        'Enjoy a magical orchestral performance amidst blooming flora, where classical masterpieces meet the tranquility of nature.',
    'image':
        'https://images.unsplash.com/photo-1648655878170-81e55f6d41ad?w=600',
  },
  {
    'title': 'Annual City Marathon',
    'category': 'Sports',
    'date': 'Feb 05 · 07:00',
    'location': 'City Center',
    'attendees': '10K',
    'description':
        'Join thousands of runners in the ultimate test of endurance, winding through historic landmarks and cheering crowds.',
    'image':
        'https://images.unsplash.com/photo-1590333748338-d629e4564ad9?w=600',
  },
  {
    'title': 'Beach Volleyball Tournament',
    'category': 'Sports',
    'date': 'Feb 12 · 10:00',
    'location': 'Sunnyvale Beach',
    'attendees': '1.5K',
    'description':
        'Watch competitive spikes and blocks on the sand as teams battle for the championship trophy under the sun.',
    'image':
        'https://images.unsplash.com/photo-1612872087720-bb876e2e67d1?w=600',
  },
  {
    'title': 'Local Football Derby',
    'category': 'Sports',
    'date': 'Feb 18 · 19:30',
    'location': 'National Stadium',
    'attendees': '45K',
    'description':
        'Witness the intense rivalry and electric atmosphere as the city\'s two biggest football clubs clash for local bragging rights.',
    'image':
        'https://images.unsplash.com/photo-1589487391730-58f20eb2c308?w=600',
  },
  {
    'title': 'International Street Food Fair',
    'category': 'Food',
    'date': 'Mar 01 · 12:00',
    'location': 'Market Square',
    'attendees': '8K',
    'description':
        'A culinary journey around the globe featuring over 50 stalls offering authentic street dishes, from spicy tacos to savory dim sum.',
    'image':
        'https://images.unsplash.com/photo-1703946908870-200ef3067952?w=600',
  },
  {
    'title': 'Gourmet Cheese and Wine Tasting',
    'category': 'Food',
    'date': 'Mar 08 · 18:00',
    'location': 'The Vineyard Estate',
    'attendees': '150',
    'description':
        'An exclusive evening for connoisseurs to sample rare vintage wines paired perfectly with artisanal cheeses.',
    'image':
        'https://images.unsplash.com/photo-1643789348016-fc3b586c7bb1?w=600',
  },
  {
    'title': 'Weekend Farmers Market',
    'category': 'Food',
    'date': 'Mar 15 · 09:00',
    'location': 'Community Hall Grounds',
    'attendees': '2K',
    'description':
        'Shop for fresh, organic produce, homemade jams, and baked goods directly from local growers and bakers.',
    'image': 'https://images.unsplash.com/photo-1550989460-0adf9ea622e2?w=600',
  },
  {
    'title': 'Sunset Yoga and Meditation',
    'category': 'Relaxing',
    'date': 'Apr 03 · 18:30',
    'location': 'Oceanview Park',
    'attendees': '75',
    'description':
        'Unwind with a guided flow yoga session followed by mindfulness meditation as the sun dips below the horizon.',
    'image': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600',
  },
  {
    'title': 'Seaside Spa and Wellness Retreat',
    'category': 'Relaxing',
    'date': 'Apr 10 · 09:00',
    'location': 'Tranquil Bay Resort',
    'attendees': '50',
    'description':
        'A full day of pampering featuring massage therapy, hydrotherapy pools, and holistic wellness workshops.',
    'image':
        'https://images.unsplash.com/photo-1620733723572-11c53f73a416?w=600',
  },
  {
    'title': 'Mindfulness and Pottery Workshop',
    'category': 'Relaxing',
    'date': 'Apr 17 · 14:00',
    'location': 'The Artisan\'s Studio',
    'attendees': '25',
    'description':
        'Connect with your creative side in this tactile workshop focused on the calming art of hand-building ceramics.',
    'image':
        'https://images.unsplash.com/photo-1590605095243-072811dbe64c?w=600',
  },
  {
    'title': 'City-Wide Summer Carnival',
    'category': 'Crowds',
    'date': 'May 05 · 11:00',
    'location': 'Downtown Streets',
    'attendees': '100K',
    'description':
        'A massive celebration filling the streets with parades, vibrant floats, street performers, and family-friendly activities.',
    'image':
        'https://images.unsplash.com/photo-1727105248086-4fc1e6db45a8?w=600',
  },
  {
    'title': 'New Year\'s Eve Street Party',
    'category': 'Crowds',
    'date': 'Dec 31 · 20:00',
    'location': 'Times Square',
    'attendees': '500K',
    'description':
        'Ring in the new year at the biggest party of the season, featuring live concerts, a countdown clock, and spectacular fireworks.',
    'image':
        'https://images.unsplash.com/photo-1573118960173-b9b6d32c442d?w=600',
  },
  {
    'title': 'Fan Zone Live Match Screening',
    'category': 'Crowds',
    'date': 'May 20 · 15:00',
    'location': 'Victory Park',
    'attendees': '15K',
    'description':
        'Gather with thousands of fans to watch the championship final on giant outdoor screens with live commentary and food trucks.',
    'image':
        'https://images.unsplash.com/photo-1504450758481-7338eba7524a?w=600',
  },
  {
    'title': 'Modern Art Gallery Opening',
    'category': 'Art',
    'date': 'Jun 01 · 19:00',
    'location': 'Galerie d\'Art Moderne',
    'attendees': '300',
    'description':
        'Be the first to view a provocative new collection of contemporary works by emerging avant-garde artists.',
    'image':
        'https://images.unsplash.com/photo-1578855019520-af8101c056e2?w=600',
  },
  {
    'title': 'Interactive Sculpture Park',
    'category': 'Art',
    'date': 'Jun 10 · 10:00',
    'location': 'Horizon Fields',
    'attendees': '1K',
    'description':
        'Walk through an immersive outdoor exhibit where large-scale installations encourage touch, climbing, and interaction.',
    'image':
        'https://images.unsplash.com/photo-1735991269129-f2e9eb345f49?w=600',
  },
  {
    'title': 'Street Art and Graffiti Tour',
    'category': 'Art',
    'date': 'Jun 18 · 13:00',
    'location': 'The Creative Quarter',
    'attendees': '100',
    'description':
        'A guided walking tour exploring the city\'s hidden murals, urban masterpieces, and the history of graffiti culture.',
    'image':
        'https://images.unsplash.com/photo-1530406831759-15c5c0cbce8b?w=600',
  },
  {
    'title': 'Adventure Travel Expo',
    'category': 'Travel',
    'date': 'Jul 07 · 11:00',
    'location': 'Exhibition & Convention Center',
    'attendees': '12K',
    'description':
        'Discover your next expedition with exhibitors showcasing trekking gear, safari packages, and extreme sports destinations.',
    'image':
        'https://images.unsplash.com/photo-1596055746427-d5f61aa5df99?w=600',
  },
  {
    'title': 'Cultural Exchange and Language Fair',
    'category': 'Travel',
    'date': 'Jul 14 · 14:00',
    'location': 'International House',
    'attendees': '2.5K',
    'description':
        'Celebrate global diversity with language practice tables, cultural performances, and traditional crafts from around the world.',
    'image':
        'https://images.unsplash.com/photo-1751083384534-e4d49e674712?w=600',
  },
  {
    'title': '\'Wonders of the World\' Photo Exhibition',
    'category': 'Travel',
    'date': 'Jul 21 · 10:00',
    'location': 'The Photography Museum',
    'attendees': '800',
    'description':
        'A stunning visual journey featuring award-winning photography of the earth\'s most breathtaking landscapes and monuments.',
    'image':
        'https://images.unsplash.com/photo-1571538557366-4bdde003beb4?w=600',
  },
  {
    'title': 'Future of AI Conference',
    'category': 'Tech',
    'date': 'Aug 02 · 09:00',
    'location': 'Silicon Valley Convention Center',
    'attendees': '5K',
    'description':
        'Industry leaders discuss the ethical implications, advancements, and future applications of artificial intelligence.',
    'image': 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600',
  },
  {
    'title': 'Innovators and Startups Summit',
    'category': 'Tech',
    'date': 'Aug 09 · 09:30',
    'location': 'Tech Hub Auditorium',
    'attendees': '3K',
    'description':
        'Networking event where budding entrepreneurs pitch disruptive ideas to investors and attend masterclasses on scaling business.',
    'image': 'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=600',
  },
  {
    'title': 'Robotics and Drone Expo',
    'category': 'Tech',
    'date': 'Aug 16 · 10:00',
    'location': 'AeroTech Hangar',
    'attendees': '7K',
    'description':
        'See the latest in automation technology, from industrial robotics to high-speed drone racing demonstrations.',
    'image':
        'https://images.unsplash.com/photo-1639046380152-8603868f2e6a?w=600',
  },
  {
    'title': 'Seasonal Fashion Week Showcase',
    'category': 'Fashion',
    'date': 'Sep 05 · 19:00',
    'location': 'The Grand Runway Hall',
    'attendees': '2K',
    'description':
        'Top designers reveal their upcoming collections in a glamorous runway show attended by influencers and editors.',
    'image': 'https://images.unsplash.com/photo-1562347174-7370ad83dc47?w=600',
  },
  {
    'title': 'Vintage and Retro Pop-Up Market',
    'category': 'Fashion',
    'date': 'Sep 12 · 11:00',
    'location': 'Old Truman Brewery',
    'attendees': '4K',
    'description':
        'Hunt for unique treasures, thrifted gems, and classic styles at this bustling marketplace for retro enthusiasts.',
    'image':
        'https://images.unsplash.com/photo-1488841714725-bb4c32d1ac94?w=600',
  },
  {
    'title': 'Sustainable Fashion Design Workshop',
    'category': 'Fashion',
    'date': 'Sep 19 · 15:00',
    'location': 'Eco-Design Collective',
    'attendees': '40',
    'description':
        'Learn upcycling techniques and eco-friendly fabric choices to create stylish garments with a minimal carbon footprint.',
    'image':
        'https://images.unsplash.com/photo-1567480503709-66518a660785?w=600',
  },
  {
    'title': 'Classic Cinema Outdoor Screening',
    'category': 'Movies',
    'date': 'Oct 04 · 20:00',
    'location': 'Greenwood Park',
    'attendees': '600',
    'description':
        'Bring a blanket and enjoy a golden-age Hollywood classic projected under the stars with popcorn and refreshments.',
    'image':
        'https://images.unsplash.com/photo-1527979809431-ea3d5c0c01c9?w=600',
  },
  {
    'title': 'Independent Film Festival',
    'category': 'Movies',
    'date': 'Oct 11 · 17:00',
    'location': 'The IndiePlex Cinema',
    'attendees': '1.8K',
    'description':
        'A week-long celebration of storytelling featuring shorts, documentaries, and features from up-and-coming directors.',
    'image':
        'https://images.unsplash.com/photo-1643651342963-d4478284de5d?w=600',
  },
  {
    'title': 'A Night with a Famous Director: Q&A',
    'category': 'Movies',
    'date': 'Oct 18 · 19:00',
    'location': 'Majestic Theatre',
    'attendees': '900',
    'description':
        'An exclusive screening followed by an in-depth conversation and audience Q&A with a legendary filmmaker.',
    'image':
        'https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=600',
  },
  {
    'title': 'Esports Championship Finals',
    'category': 'Gaming',
    'date': 'Nov 02 · 18:00',
    'location': 'Cyber Stadium',
    'attendees': '18K',
    'description':
        'The world\'s best teams compete for the grand prize in a high-stakes arena filled with LED screens and roaring fans.',
    'image': 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=600',
  },
  {
    'title': 'Retro Arcade Game Night',
    'category': 'Gaming',
    'date': 'Nov 09 · 20:00',
    'location': 'Pixel Bar',
    'attendees': '200',
    'description':
        'Relive the 80s and 90s with unlimited play on classic arcade cabinets, console tournaments, and themed cocktails.',
    'image':
        'https://images.unsplash.com/photo-1498736297812-3a08021f206f?w=600',
  },
  {
    'title': 'Indie Game Developer Showcase',
    'category': 'Gaming',
    'date': 'Nov 16 · 12:00',
    'location': 'GameDev Hub',
    'attendees': '1.5K',
    'description':
        'Play unreleased demos and meet the creative minds behind the most innovative independent video games of the year.',
    'image':
        'https://images.unsplash.com/photo-1647320293733-92affa4fa39c?w=600',
  },
  {
    'title': 'Author Book Signing and Reading',
    'category': 'Books',
    'date': 'Dec 01 · 16:00',
    'location': 'The Grand Library',
    'attendees': '250',
    'description':
        'Meet the bestselling author as they read excerpts from their latest novel and sign copies for fans.',
    'image':
        'https://images.unsplash.com/photo-1728674271788-86aaadbb41c1?w=600',
  },
  {
    'title': 'Local Book Club Meetup',
    'category': 'Books',
    'date': 'Dec 08 · 18:30',
    'location': 'The Cozy Corner Cafe',
    'attendees': '30',
    'description':
        'A casual gathering for literature lovers to discuss this month\'s pick over warm beverages and pastries.',
    'image':
        'https://images.unsplash.com/photo-1588666309990-d68f08e3d4a6?w=600',
  },
  {
    'title': 'Antique and Rare Book Fair',
    'category': 'Books',
    'date': 'Dec 15 · 10:00',
    'location': 'Heritage Exhibition Hall',
    'attendees': '3.5K',
    'description':
        'A collector\'s paradise featuring first editions, ancient manuscripts, and out-of-print literary treasures.',
    'image':
        'https://images.unsplash.com/photo-1601112240187-bb84eb6878fc?w=600',
  },
];
