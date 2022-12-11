import 'package:doan/Shop.dart';
import 'package:doan/storage.dart';
import 'package:doan/profile_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'login_gg/login_gg.dart';
import 'Login.dart';
class SideMenu extends StatelessWidget {
  List<String> lstItem = [
    "Thông tin cá nhân",
    'Kho đồ',
    "Danh sách bạn bè",
    "Xếp hạng",
    "Shop"
  ];
  void _handleButton(int index, BuildContext context) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Storage()));
    }
    if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Storage()));
    }
    if (index == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Storage()));
    }
    if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  Shop()));
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/backgroundsidemenu.jpg',
                      ),
                    ),
                  ),
                  accountName: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Yuna Ogura",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text("ID: 1256398"),
                      ],
                    ),
                  ),
                  currentAccountPictureSize: Size.square(90),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'images/avatar.jpg',
                      ),
                    ),
                  ),
                  accountEmail: null,
                ),
                Positioned(
                  right: 5,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Container(
                        width: 100,
                        child: Icon(
                          Icons.arrow_circle_right_rounded,
                          color: Color.fromARGB(255, 250, 194, 64),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: lstItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () => _handleButton(index, context),
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      alignment: Alignment.centerLeft,
                      height: 70,
                      child: Text(
                        lstItem[index],
                        style: TextStyle(
                            color: Color.fromARGB(255, 51, 51, 51),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                }),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                 Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
              },
              child: Container(
                child: Text(
                  'Đăng xuất',
                  style: TextStyle(
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
