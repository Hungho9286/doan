import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  int id;
  String name;
  String address;
  String phoneNumber;
  String avatar;
  bool online;
  bool status;
  int point;
  User({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.avatar,
    required this.online,
    required this.status,
    required this.point,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'phoneNumber': phoneNumber,
        'avatar': avatar,
        'online': online,
        'status': status,
        'point': point,
      };
  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc.data().toString().contains('id') ? doc.get('id') : 0,
      name: doc.data().toString().contains('name') ? doc.get('name') : '',
      address:
          doc.data().toString().contains('address') ? doc.get('address') : '',
      phoneNumber: doc.data().toString().contains('phoneNumber')
          ? doc.get('phoneNumber')
          : '',
      avatar: doc.data().toString().contains('avatar') ? doc.get('avatar') : '',
      online:
          doc.data().toString().contains('online') ? doc.get('online') : false,
      status:
          doc.data().toString().contains('status') ? doc.get('status') : false,
      point: doc.data().toString().contains('point') ? doc.get('point') : 0,
    );
  }
}
