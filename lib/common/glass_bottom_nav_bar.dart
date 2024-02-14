import 'package:contacts_app/common/add_contact_bottom_sheet.dart';
import 'package:contacts_app/common/glass_box.dart';
import 'package:contacts_app/screens/favorites.dart';
import 'package:contacts_app/screens/home.dart';
import 'package:contacts_app/screens/recents.dart';
import 'package:contacts_app/screens/voice_message.dart';
import 'package:flutter/material.dart';

class MyGlassBottomNavigator extends StatefulWidget {
  const MyGlassBottomNavigator({super.key});

  @override
  State<MyGlassBottomNavigator> createState() => _MyGlassBottomNavigatorState();
}

class _MyGlassBottomNavigatorState extends State<MyGlassBottomNavigator> {
  List<Widget> screens = [
    const FavoritesScreen(),
    const HomeScreen(),
    const RecentsScreen(),
    const VoiceMessage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[_currentIndex],
      bottomNavigationBar: GlassBox(
        child: BottomNavigationBar(
          elevation: 0,
          enableFeedback: false,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Recent',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mic_none_rounded),
              label: 'Record',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return const AddContactBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
