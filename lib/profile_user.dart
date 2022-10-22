import 'package:doan/choose_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) => ProfileHome();
}

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  _ProfileHomeState createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin cá nhân'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: UserAccountsDrawerHeader(
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
                currentAccountPictureSize: const Size.square(90),
                currentAccountPicture: CircleAvatar(
                  radius: 70,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'images/avatar.jpg',
                    ),
                  ),
                ),
                accountEmail: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
