import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/Shop.dart';
import 'package:doan/user.dart';
import 'package:flutter/material.dart';
import 'package:doan/answer_question.dart';
import 'package:iconsax/iconsax.dart';
import 'package:doan/side_menu.dart';
import 'choose_categories.dart';
import 'inventories_object.dart';

class Item_support extends StatelessWidget {
  const Item_support({super.key});

  @override
  Widget build(BuildContext context) => Item_supportHome();
}

class Item_supportHome extends StatefulWidget {
  const Item_supportHome({super.key});

  @override
  State<Item_supportHome> createState() => _Item_supportHomeState();
}

class _Item_supportHomeState extends State<Item_supportHome> {
  User u = new User(
      id: 0,
      name: '',
      email: '',
      password: '',
      address: '',
      phoneNumber: '',
      avatar: '',
      online: true,
      status: true,
      point: 0,
      turn: 0);
  var user = FirebaseFirestore.instance
      .collection('users')
      .doc('81N7Q8y4mPAWNVKCwnIU');
  var inventories = FirebaseFirestore.instance.collection('inventories');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUser();
    setState(() {});
  }

  void _getUser() async {
    setState(() {
      user.get().then(
        (value) async {
          u = User.fromJson(value.data()!);
          // u.name = value.data()!['NickName'];
          // u.address = value.data()!['Address'];
          // u.point = value.data()!['ChaoPoint'];
          // u.phoneNumber = value.data()!['Phone'];
          // u.turn = value.data()!['Turn'];
          // u.email = value.data()!['Email'];
          // u.password = value.data()!['Password'];
        },
      );
    });
  }

  @override
  Container _createContainer(String txt, Image img) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 249, 149, 113),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            height: 40,
            width: 220,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 5),
                  child: Text(
                    txt,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                img
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _createButton(String txt, Image img) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          border:
              Border.all(width: 2, color: Color.fromARGB(255, 142, 228, 142)),
        ),
        height: 40,
        width: 60,
        child: TextButton(
          onPressed: () {
            int mount = int.parse(txt);
            if (u.point < mount) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('HẾT TIỀN'),
                        content: Text('Không đủ hủ Chao để mua'),
                      ));
            } else {
              switch (mount) {
                case 30:
                  {
                    if (u.point >= 30) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: 'gBjKXaExKhFWt9uVDcJy',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.point - 30});
                      setState(() {
                        u.point = u.point - 30;
                      });
                    }
                  }
                  break;
                case 40:
                  {
                    if (u.point >= 40) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: 'GHullBLyOFrS1jAtrqTQ',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.point - 40});
                      setState(() {
                        u.point = u.point - 40;
                      });
                    }
                  }
                  break;
                case 50:
                  {
                    if (u.point >= 50) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: 'ZYgzISbVFeggSdsQOlEQ',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.point - 50});
                      setState(() {
                        u.point = u.point - 50;
                      });
                    }
                  }
                  break;
                case 80:
                  {
                    if (u.point >= 80) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: 'yVDR0kT4MYoBMvOhA9hQ',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.point - 80});
                      setState(() {
                        u.point = u.point - 80;
                      });
                    }
                  }
                  break;
              }
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                txt,
                style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              img
            ],
          ),
        ));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cửa Hàng',
      home: Scaffold(
        drawer: SideMenu(),
        body: Center(
          //header
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 10),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            border: Border.all(
                                width: 2, color: Colors.yellowAccent),
                          ),
                          alignment: Alignment.center,
                          child: Text(u.turn.toString()),
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
                    padding: EdgeInsets.only(top: 40, left: 20, right: 10),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(20),
                            border: Border.all(
                                width: 2, color: Colors.yellowAccent),
                          ),
                          alignment: Alignment.center,
                          child: Text(u.point.toString()),
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
              //Body
              //Title
              Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 248, 111, 69),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        height: 60,
                        width: 300,
                        child: Center(
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Trợ Giúp/Tăng Điểm',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Image.asset(
                                'images/item_sp.png',
                                fit: BoxFit.cover,
                                width: 30,
                              )
                            ],
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 5, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                '50/50',
                                Image.asset(
                                  'images/item_sp.png',
                                  fit: BoxFit.cover,
                                  width: 30,
                                )),
                            _createButton(
                                '30',
                                Image.asset(
                                  'images/chao.png',
                                  fit: BoxFit.cover,
                                  height: 30,
                                ))
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                'Gợi Ý',
                                Image.asset(
                                  'images/item_sp.png',
                                  fit: BoxFit.cover,
                                  width: 30,
                                )),
                            _createButton(
                                '40',
                                Image.asset(
                                  'images/chao.png',
                                  fit: BoxFit.cover,
                                  height: 30,
                                ))
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                'Cộng thêm thời gian (30s)',
                                Image.asset(
                                  'images/stopwatch.png',
                                  fit: BoxFit.cover,
                                  width: 29,
                                )),
                            _createButton(
                                '50',
                                Image.asset(
                                  'images/chao.png',
                                  fit: BoxFit.cover,
                                  height: 30,
                                )),
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                'Nhân đôi điểm',
                                Image.asset(
                                  'images/item_sp.png',
                                  fit: BoxFit.cover,
                                  width: 30,
                                )),
                            _createButton(
                                '80',
                                Image.asset(
                                  'images/chao.png',
                                  fit: BoxFit.cover,
                                  height: 30,
                                ))
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        //footer
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChooseCategories()));
            },
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Shop()));
                    },
                    child: Icon(
                      Iconsax.shop,
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
    //footer end
  }
}
