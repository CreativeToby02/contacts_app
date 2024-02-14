import 'package:contacts_app/screens/call_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ContactDetailScreen extends StatefulWidget {
  static const String name = 'contact-detail';
  static const String route = '/contact-detail';
  const ContactDetailScreen({
    super.key,
    this.fullName,
    this.phone,
    this.email,
    this.contactImage,
  });

  final String? fullName;
  final String? phone;
  final String? email;
  final String? contactImage;

  @override
  State<ContactDetailScreen> createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;

  void isSelected1() {
    setState(() {
      selected1 = !selected1;
    });
    if (selected1 == true) {
      selected2 = false;
      selected3 = false;
      selected4 = false;
    }
  }

  void isSelected2() {
    setState(() {
      selected2 = !selected2;
    });
    if (selected2 == true) {
      selected1 = false;
      selected3 = false;
      selected4 = false;
    }
  }

  void isSelected3() {
    setState(() {
      selected3 = !selected3;
    });
    if (selected3 == true) {
      selected1 = false;
      selected2 = false;
      selected4 = false;
    }
  }

  void isSelected4() {
    setState(() {
      selected4 = !selected4;
    });
    if (selected4 == true) {
      selected1 = false;
      selected2 = false;
      selected3 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/edit-text.png',
                          color: Colors.white.withOpacity(0.4),
                          scale: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    badges.Badge(
                      badgeContent: const Center(
                          child: Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      )),
                      position: badges.BadgePosition.custom(start: 75, top: 18),
                      badgeStyle: badges.BadgeStyle(
                        shape: badges.BadgeShape.square,
                        badgeColor: Colors.green.shade800,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 3),
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.black54, width: 3),
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFFF2F2F2).withOpacity(0.2),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('${widget.contactImage}'),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${widget.fullName}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 24),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${widget.phone}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${widget.email}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PhoneDetailOptionButton(
                        icon: Icons.phone,
                        isTapped: selected1,
                        onTap: () {
                          setState(() {
                            isSelected1();
                            Future.delayed(const Duration(milliseconds: 600),
                                () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CallScreen(
                                  contactName: widget.fullName,
                                  contactImage: widget.contactImage,
                                );
                              }));
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                isSelected1();
                              });
                            });
                          });
                        },
                      ),
                      PhoneDetailOptionButton(
                        icon: Icons.videocam,
                        isTapped: selected2,
                        onTap: isSelected2,
                      ),
                      PhoneDetailOptionButton(
                        icon: Icons.chat,
                        isTapped: selected3,
                        onTap: isSelected3,
                      ),
                      PhoneDetailOptionButton(
                        icon: Icons.mail,
                        isTapped: selected4,
                        onTap: isSelected4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: PhoneDetailRecord(
                      icon: Icon(
                        Icons.phone_missed_rounded,
                        color: Colors.red,
                      ),
                      callTypeText: 'Missed Call',
                      textColor: Colors.red,
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: PhoneDetailRecord(
                      icon: Icon(
                        Icons.phone_callback_rounded,
                        color: Colors.white,
                      ),
                      callTypeText: 'Incoming Call',
                      textColor: Colors.white,
                    )),
                  ],
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bio',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple.shade300.withOpacity(0.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.fullName} is Product Designer at Piqo Design Agency',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 16, color: Colors.white38),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Email: piqo@info.com',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 16, color: Colors.white38),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneDetailRecord extends StatelessWidget {
  const PhoneDetailRecord({
    super.key,
    required this.icon,
    required this.callTypeText,
    this.textColor,
  });

  final Icon icon;
  final String callTypeText;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepPurple.shade300.withOpacity(0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 10),
            Text(
              callTypeText,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16, color: textColor),
            ),
            const SizedBox(height: 10),
            Text(
              '09:30 pm',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 14, color: Colors.white38),
            ),
            const SizedBox(height: 10),
            Text(
              '4',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 18, color: Colors.white38),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneDetailOptionButton extends StatelessWidget {
  const PhoneDetailOptionButton({
    super.key,
    this.icon,
    this.isTapped,
    this.onTap,
  });

  final bool? isTapped;
  final IconData? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isTapped == true ? Colors.blue.withOpacity(0.8) : null,
            border: Border.all(
                width: 0.5,
                color: isTapped == true ? Colors.transparent : Colors.white)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
