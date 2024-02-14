import 'package:contacts_app/common/widgets.dart';
import 'package:contacts_app/services/contact_add_request.dart';
import 'package:flutter/material.dart';

class AddContactBottomSheet extends StatefulWidget {
  const AddContactBottomSheet({
    super.key,
  });

  @override
  State<AddContactBottomSheet> createState() => _AddContactBottomSheetState();
}

class _AddContactBottomSheetState extends State<AddContactBottomSheet> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  ContactAdder contactAdder = ContactAdder();
  // Future<List<ContactAlbum>> contactAdder = ContactAdder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add New Contact',
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'First Name',
          ),
          const SizedBox(height: 10),
          ContactTextField(
            controller: _firstName,
          ),
          const SizedBox(height: 20),
          const Text(
            'Last Name',
          ),
          const SizedBox(height: 10),
          ContactTextField(
            controller: _lastName,
          ),
          const SizedBox(height: 20),
          const Text(
            'Email',
          ),
          const SizedBox(height: 10),
          ContactTextField(
            controller: _email,
          ),
          const SizedBox(height: 20),
          const Text(
            'Phone Number',
          ),
          const SizedBox(height: 10),
          ContactTextField(
            controller: _phone,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                contactAdder.addContactData(
                  _firstName.text,
                  _lastName.text,
                  _email.text,
                  _phone.text,
                );
                Navigator.pop(context);
              });
            },
            child: const Text(
              'Add',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
