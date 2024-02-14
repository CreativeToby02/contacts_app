// ignore_for_file: deprecated_member_use
import 'package:contacts_app/common/widgets.dart';
import 'package:contacts_app/screens/contact_detail.dart';
import 'package:contacts_app/services/album.dart';
import 'package:contacts_app/services/contact_list_request.dart';
// import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home';
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List contactImage = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image8.jpg',
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  bool selected1 = true;
  bool selected2 = false;

  void changeTab1() {
    setState(() {
      selected1 = !selected1;
    });
    if (selected1 = true) {
      selected2 = false;
    }
  }

  void changeTab2() {
    setState(() {
      selected2 = !selected2;
    });
    if (selected2 = true) {
      selected1 = false;
    }
  }

  Future<List<ContactAlbum>> contactData = ContactHelper.getContactInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabOption(
                      title: 'All',
                      isSelected: selected1,
                      onTap: changeTab1,
                    ),
                    const SizedBox(width: 20),
                    TabOption(
                      title: 'Missed',
                      isSelected: selected2,
                      onTap: changeTab2,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recents',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/edit-text.png',
                        color: Colors.white,
                        scale: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ContactTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 14),
                    child: SvgPicture.asset('assets/icons/search.svg',
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
//
                FutureBuilder<List<ContactAlbum>>(
                  future: contactData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return
                          // Text(snapshot.data!.firstName);
                          ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final user = snapshot.data![index];
                          return MaterialButton(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ContactDetailScreen(
                                      contactImage: contactImage[index],
                                      fullName: user.firstName,
                                      phone: user.phone,
                                      email: user.email,
                                    );
                                  },
                                ),
                              );
                            },
                            child: ContactTile(
                              contactImage: contactImage[index],
                              name: user.firstName.toString(),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
