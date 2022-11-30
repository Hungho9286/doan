import 'package:doan/answer_question.dart';
import 'package:doan/friend_details.dart';
import 'package:doan/listfriend_chat.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:doan/side_menu.dart';

class ChooseCategories extends StatelessWidget {
  ChooseCategories({super.key});

  @override
  Widget build(BuildContext context) => ChooseCategories_Home();
}

class ChooseCategories_Home extends StatefulWidget {
  ChooseCategories_Home({super.key});

  @override
  ChooseCategoriesState createState() => ChooseCategoriesState();
}

class ChooseCategoriesState extends State<ChooseCategories_Home> {
  @override
  Widget _createButtonCategories(
      String strImage, String strCategories, Color color, int fieldid) {
    return TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AnswerScreen(fieldid)));
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Image.asset(
                strImage,
                fit: BoxFit.cover,
                width: 90,
              ),
            ),
            Container(
              child: Stack(
                children: [
                  Text(
                    strCategories,
                    style: TextStyle(
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 1.5,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    strCategories,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chọn lĩnh vực',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "CATEGORIES",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        drawer: SideMenu(),
        body: Center(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _createButtonCategories(
                  'images/technology.png',
                  'Công nghệ',
                  Color.fromARGB(255, 134, 168, 69),
                  1,
                ),
                _createButtonCategories(
                  'images/math.png',
                  'Toán học',
                  Color.fromARGB(255, 162, 216, 159),
                  2,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _createButtonCategories(
                  'images/Literature.png',
                  'Văn học',
                  Color.fromARGB(255, 204, 240, 197),
                  3,
                ),
                _createButtonCategories(
                  'images/history.png',
                  'Lịch sử',
                  Color.fromARGB(255, 254, 212, 110),
                  4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _createButtonCategories(
                  'images/geography.png',
                  'Địa lí',
                  Color.fromARGB(255, 91, 95, 151),
                  5,
                ),
                _createButtonCategories(
                  'images/funny.png',
                  'Đố vui',
                  Color.fromARGB(255, 1255, 107, 108),
                  6,
                ),
              ],
            ),
          ]),
        ),
        floatingActionButton: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color.fromARGB(255, 250, 196, 32),
            child: Container(
              child: Icon(
                Icons.home,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 134, 168, 69),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Iconsax.shop5,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Iconsax.ranking_15,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Contact(),
                        ),
                      );
                    },
                    child: Icon(
                      Iconsax.message5,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FriendDetail(),
                        ),
                      );
                    },
                    child: Icon(
                      Iconsax.profile_circle5,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
