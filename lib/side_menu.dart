import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SideMenu extends StatelessWidget {
  List<String> lstItem = [
    "Thông tin cá nhân",
    'Kho đồ',
    "Danh sách bạn bè",
    "Xếp hạng",
    "Shop"
  ];
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Frog",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text("ID: 1256398"),
                      ],
                    ),
                  ),
                  accountEmail: null,
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: Container(
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/avatar.jpg'),
                    ),
                  ),
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
                    onPressed: () {},
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
              onPressed: () {},
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
