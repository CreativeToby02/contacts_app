// ignore_for_file: avoid_print
import 'dart:convert';
// import 'package:contacts_app/services/album.dart';
import 'package:http/http.dart' as http;

class ContactAdder {
  Future<dynamic> addContactData(
      String firstName, String lastName, String email, String phone) async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTE3ZmJiNGQzOWQ1NzAwMTNiZjc4MWYiLCJpYXQiOjE3MDc0NjM4NjN9.QPfIDxo1RQVfow6RSmSyrcTFHsWnjRKo84k_vUiWSMA';

    final request = jsonEncode(<String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    });

    final response = await http.post(
      Uri.parse('https://thinking-tester-contact-list.herokuapp.com/contacts'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: request,
    );

    if (response.statusCode == 201) {
      dynamic decodedData = jsonDecode(response.body);
      print(decodedData);
      // List<ContactAlbum> contactAlbum =
      //     decodedData.map<ContactAlbum>(ContactAlbum.fromJson).toList();
      // return contactAlbum;
      return decodedData;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load album, Response Unsuccessful');
    }
  }
}
