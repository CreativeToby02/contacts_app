import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Favorites',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 50),
              LottieBuilder.asset('assets/images/favorite_contact.json'),
            ],
          ),
        ),
      ),
    );
  }
}
