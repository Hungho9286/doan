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
  String email;
  String password;
  int turn;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.phoneNumber,
    required this.avatar,
    required this.online,
    required this.status,
    required this.point,
    required this.turn,
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
      email: doc.data().toString().contains('email') ? doc.get('email') : '',
      password:
          doc.data().toString().contains('password') ? doc.get('password') : '',
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
      turn: doc.data().toString().contains('turn') ? doc.get('turn') : 0,
    );
  }

  User.fromJson(Map<String, dynamic> res)
      : id = res[''],
        name = res['Nickname'],
        email = res['Email'],
        password = res['PassWord'],
        point = res['ChaoPoint'],
        address = res['Address'],
        phoneNumber = res['Phone'],
        turn = res['Turn'],
        avatar = res[''],
        online = res['true'],
        status = res['true'];
}
