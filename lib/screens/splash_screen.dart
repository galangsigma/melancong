// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:geolocator/geolocator.dart';

// Project imports:
import 'package:fluterproject/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _statusMessage = "Memuat...";

  @override
  void initState() {
    super.initState();
    _requestLocationContinue();
  }

  void _requestLocationContinue() async {
    print("Requesting");
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        setState(() {
          _statusMessage = "Kami perlu akses lokasi Anda.";
        });
      } else if (permission == LocationPermission.deniedForever) {
        setState(() {
          _statusMessage =
              "Kami perlu akses lokasi Anda. Mohon ubah permission pada pengaturan.";
        });
      } else {
        _continue();
      }
    } catch (e) {
      print("Error requesting permission");
      _continue();
    }
  }

  void _continue() {
    Navigator.pushReplacementNamed(context, '/interests');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.location_on, size: 80, color: Color(0xFFf25aa6)),
              const SizedBox(height: 24),
              Text(
                'Temukan Event di Sekitar Anda',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(height: 32),

              const CircularProgressIndicator(color: Color(0xFFf25aa6)),

              const SizedBox(height: 16),

              Text(
                _statusMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () => _requestLocationContinue(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorPink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Tentukan Lokasi',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
