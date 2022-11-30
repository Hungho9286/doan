import 'package:doan/Item_support.dart';
import 'package:flutter/material.dart';
import 'package:doan/answer_question.dart';
import 'package:iconsax/iconsax.dart';
import 'package:doan/side_menu.dart';
import 'turn.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) => ShopHome();
}

class ShopHome extends StatefulWidget {
  const ShopHome({super.key});

  @override
  State<ShopHome> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cửa Hàng',
      home: Scaffold(
        drawer: SideMenu(),
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 10),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            border: Border.all(
                                width: 2, color: Colors.yellowAccent),
                          ),
                          alignment: Alignment.center,
                          child: Text('5000'),
                          height: 20,
                          width: 70,
                        ),
                        Positioned(
                            right: 55,
                            width: 16,
                            height: 20,
                            child: Image.asset(
                              'images/heart.png',
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 10),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            border: Border.all(
                                width: 2, color: Colors.yellowAccent),
                          ),
                          alignment: Alignment.center,
                          child: Text('5000'),
                          height: 20,
                          width: 70,
                        ),
                        Positioned(
                            right: 55,
                            width: 16,
                            height: 20,
                            child: Image.asset('images/ticket.png',
                                fit: BoxFit.cover)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 10),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            border: Border.all(
                                width: 2, color: Colors.yellowAccent),
                          ),
                          alignment: Alignment.center,
                          child: Text('5000'),
                          height: 20,
                          width: 70,
                        ),
                        Positioned(
                            right: 55,
                            width: 16,
                            height: 20,
                            child: Image.asset('images/chao.png',
                                fit: BoxFit.cover)),
                      ],
                    ),
                  )
                ],
              ),
              Center(
                heightFactor: 1.5,
                child: Text(
                  'Cửa Hàng',
                  style: TextStyle(fontSize: 50, color: Colors.black),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Turn()));
                        },
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 68, 240, 46),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Container(
                              padding: EdgeInsets.all(20),
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 50),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          'images/heart.png',
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lượt chơi',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        )),
                    TextButton(
                        onPressed: () {
                           Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Item_support()));
                        },
                        child: Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 248, 111, 69),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(bottom: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(right: 17, top: 17),
                                        child: Icon(
                                          Icons.help,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Trợ giúp',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))),
                  ],
                ),
              ),
            ],
          ),
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
