import 'package:doan/answer_question.dart';
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
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AnswerScreen(1)));
                  },
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 134, 168, 69),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'images/technology.png',
                          fit: BoxFit.cover,
                          width: 90,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            Text(
                              'Công nghệ',
                              style: TextStyle(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1.5,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Công nghệ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 162, 216, 159),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'images/math.png',
                          fit: BoxFit.cover,
                          width: 90,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            Text(
                              'Toán học',
                              style: TextStyle(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1.5,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Toán học',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 240, 197),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'images/Literature.png',
                          fit: BoxFit.cover,
                          width: 90,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            Text(
                              'Văn học',
                              style: TextStyle(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1.5,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Văn học',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 254, 212, 110),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'images/history.png',
                          fit: BoxFit.cover,
                          width: 90,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            Text(
                              'Lịch sử',
                              style: TextStyle(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1.5,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Lịch sử',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 91, 95, 151),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'images/geography.png',
                          fit: BoxFit.cover,
                          width: 60,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            Text(
                              'Địa lí',
                              style: TextStyle(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1.5,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Địa lí',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 1255, 107, 108),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'images/funny.png',
                          fit: BoxFit.cover,
                          width: 100,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            Text(
                              'Đố vui',
                              style: TextStyle(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1.5,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Đố vui',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
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
                    onPressed: () {},
                    child: Icon(
                      Iconsax.message5,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
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
