class User {
  String name;
  String address;
  String phoneNumber;
  String email;
  String password;
  
  int pointChao;
  int turn;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.phoneNumber,
   
    required this.pointChao,
    required this.turn,
  });
  Map<String, dynamic> toJson() {
    return {
      'NickName': name,
      'Address': address,
      'Phone': phoneNumber,
      'ChaoPoint': pointChao,
      'PassWord':password,
      'Email':email,
      'Turn': turn,
    };
  }

  User.fromJson(Map<String, dynamic> res)
      : name = res['Nickname'],
        email = res['Email'],
        password = res['PassWord'],
        pointChao = res['ChaoPoint'],
        address = res['Address'],
        phoneNumber=res['Phone'],
        turn=res['Turn']
        ;
}
