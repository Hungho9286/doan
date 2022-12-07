class User {
  int id;
  String name;
  String address;
  String phoneNumber;

  bool status;
  int pointChao;
  int pointChallege;
  User({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.status,
    required this.pointChao,
    required this.pointChallege,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'pointChao': pointChao,
      'status': status
    };
  }
}
