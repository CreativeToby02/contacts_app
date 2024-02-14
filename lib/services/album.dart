class ContactAlbum {
  final String? firstName;
  final String? phone;
  final String? email;

  const ContactAlbum({
    required this.firstName,
    required this.phone,
    required this.email,
  });

  static ContactAlbum fromJson(dynamic json) {
    return ContactAlbum(
      firstName: json['firstName'],
      phone: json['phone'],
      email: json['email'],
    );

    // factory ContactAlbum.fromJson(dynamic json) {
    // static ContactAlbum fromJson(dynamic json) {

    // return switch (json) {
    //   {
    //     'firstName': String firstName,
    //     'phone': int phone,
    //     'email': String email,
    //   } =>
    //     ContactAlbum(
    //       firstName: firstName,
    //       phone: phone,
    //       email: email,
    //     ),
    //   _ => throw const FormatException('Failed to load album.'),
    // };
  }

  dynamic toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['firstName'] = firstName;
    json['phone'] = phone;
    json['email'] = email;
  }
}

// class MobileData {
//   String? type;
//   String? code;
//   String? description;
//   String? amount;
//   String? price;
//   String? value;
//   String? duration;

//   MobileData(
//       {this.type,
//       this.code,
//       this.description,
//       this.amount,
//       this.price,
//       this.value,
//       this.duration});

//   MobileData.fromJson(Map<String, dynamic> json) {
//     type = json['type'];
//     code = json['code'];
//     description = json['description'];
//     amount = json['amount'];
//     price = json['price'];
//     value = json['value'];
//     duration = json['duration'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['type'] = type;
//     data['code'] = code;
//     data['description'] = description;
//     data['amount'] = amount;
//     data['price'] = price;
//     data['value'] = value;
//     data['duration'] = duration;
//     return data;
//   }
// }
