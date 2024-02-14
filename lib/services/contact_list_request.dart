// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:contacts_app/services/album.dart';
import 'package:http/http.dart' as http;

class ContactHelper {
  static Future<List<ContactAlbum>> getContactInfo() async {
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTE3ZmJiNGQzOWQ1NzAwMTNiZjc4MWYiLCJpYXQiOjE3MDc0NjM4NjN9.QPfIDxo1RQVfow6RSmSyrcTFHsWnjRKo84k_vUiWSMA';

    final response = await http.get(
      Uri.parse('https://thinking-tester-contact-list.herokuapp.com/contacts'),
      headers: {
        'Authorization':
            'Bearer $token', // Include the token in the Authorization header
        'Content-Type':
            'application/json', // Specify the content type if needed
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> decodedData = jsonDecode(response.body);
      // print(decodedData);
      List<ContactAlbum> contactAlbum =
          decodedData.map<ContactAlbum>(ContactAlbum.fromJson).toList();
      return contactAlbum;
    } else {
      print(response.statusCode);
      throw Exception('Failed to load contact album, Response Unsuccessful');
    }
  }
}



// https://thinking-tester-contact-list.herokuapp.com/contacts

  // const apiKey = 'ee5d92c780fa41e493b93a61619b5deb';
  // const baseURL = 'https://newsapi.org/v2';

  // final response = await http.get(
  //   Uri.parse('$baseURL/top-headlines?country=us&apiKey=$apiKey'),
  // );

  // List<dynamic> decodedData = jsonDecode(response.body);
  //     print(decodedData);
  //     // print(decodedData[0]['firstName']);
  //     List<ContactAlbum> contactAlbum =
  //         decodedData.map((item) => ContactAlbum.fromJson(item)).toList();
  //         print(decodedData);