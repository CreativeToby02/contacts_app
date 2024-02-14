import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RecentsScreen extends StatelessWidget {
  const RecentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Contacts',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 50),
              LottieBuilder.asset('assets/images/call_animation.json'),
            ],
          ),
        ),
      ),
    );
  }
}
