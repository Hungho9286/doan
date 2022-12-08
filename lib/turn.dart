import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan/inventories_object.dart';
import 'package:doan/inventories_user.dart';
import 'package:doan/user.dart';
import 'package:flutter/material.dart';
import 'package:doan/answer_question.dart';
import 'package:iconsax/iconsax.dart';
import 'package:doan/side_menu.dart';
import 'Shop.dart';
import 'choose_categories.dart';

class Turn extends StatelessWidget {
  const Turn({super.key});

  @override
  Widget build(BuildContext context) => TurnHome();
}

class TurnHome extends StatefulWidget {
  const TurnHome({super.key});

  @override
  State<TurnHome> createState() => _TurnHomeState();
}

class _TurnHomeState extends State<TurnHome> {
  
  User u = new User(
      name: '',
      email: '',
      password: '',
      address: '',
      phoneNumber: '',
      pointChao: 0,
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
          // u.pointChao = value.data()!['ChaoPoint'];
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
              color: Color.fromARGB(255, 124, 238, 108),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            height: 40,
            width: 200,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    txt,
                    style: TextStyle(
                        fontSize: 15,
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

  Container _createContainerStack(String txt, Image img1, Image img2) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 124, 238, 108),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            height: 40,
            width: 250,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    txt,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Stack(
                  children: [
                    img1,
                    Positioned(top: 10, width: 20, child: img2),
                  ],
                )
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
        width: 80,
        child: TextButton(
          onPressed: () {
            int mount = int.parse(txt);
            if (u.pointChao < mount) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('HẾT TIỀN'),
                        content: Text('Không đủ hủ Chao để mua'),
                      ));
            } else {
              switch (mount) {
                case 5:
                  {
                    if (u.pointChao >= 5) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: 'G5DgeEVCPGE8rj5O0D0Y',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.pointChao - 5});
                      setState(() {
                        u.pointChao = u.pointChao - 5;
                      });
                    }
                  }
                  break;
                case 25:
                  {
                    if (u.pointChao >= 25) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: 'qyrPx623vHfeBeGs93Ze',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.pointChao - 25});
                      setState(() {
                        u.pointChao = u.pointChao - 25;
                      });
                    }
                  }
                  break;
                case 45:
                  {
                    if (u.pointChao >= 45) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: '2ER0Brk0wK1v42x11UzO',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.pointChao - 45});
                      setState(() {
                        u.pointChao = u.pointChao - 45;
                      });
                    }
                  }
                  break;
                case 100:
                  {
                    if (u.pointChao >= 100) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: '6b7EnQ2nUve7zqeigIyd',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.pointChao - 100});
                      setState(() {
                        u.pointChao = u.pointChao - 100;
                      });
                    }
                  }
                  break;
                case 250:
                  {
                    if (u.pointChao >= 250) {
                      Inventories_object inVent = new Inventories_object(
                          idUser: '81N7Q8y4mPAWNVKCwnIU',
                          idItem: 'xdPc4U9tUMVRppN73ULc',
                          amount: 1);
                      inventories.add(inVent.toJson());
                      user.update({'ChaoPoint': u.pointChao - 250});
                      setState(() {
                        u.pointChao = u.pointChao - 250;
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
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              img
            ],
          ),
        ));
  }

  Widget build(BuildContext context) {
    _getUser();
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
                          child: Text(u.pointChao.toString()),
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
                          color: Color.fromARGB(255, 68, 240, 46),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        height: 60,
                        width: 300,
                        child: Center(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 40, right: 25),
                                child: Text(
                                  'Lượt Chơi',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Image.asset(
                                'images/heart.png',
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 5, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                '1 lượt',
                                Image.asset(
                                  'images/heart.png',
                                  fit: BoxFit.cover,
                                  width: 25,
                                )),
                            _createButton(
                                '5',
                                Image.asset(
                                  'images/chao.png',
                                  fit: BoxFit.cover,
                                  height: 30,
                                ))
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                '5 lượt',
                                Image.asset(
                                  'images/heart.png',
                                  fit: BoxFit.cover,
                                  width: 25,
                                )),
                            _createButton(
                                '25',
                                Image.asset(
                                  'images/chao.png',
                                  fit: BoxFit.cover,
                                  height: 30,
                                ))
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                '10 lượt',
                                Image.asset(
                                  'images/heart.png',
                                  fit: BoxFit.cover,
                                  width: 25,
                                )),
                            _createButton(
                                '45',
                                Image.asset(
                                  'images/chao.png',
                                  fit: BoxFit.cover,
                                  height: 30,
                                ))
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                '25 lượt',
                                Image.asset(
                                  'images/heart.png',
                                  fit: BoxFit.cover,
                                  width: 25,
                                )),
                            _createButton(
                                '100',
                                Image.asset(
                                  'images/chao.png',
                                  fit: BoxFit.cover,
                                  height: 30,
                                ))
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(bottom: 5, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createContainer(
                                '50 lượt',
                                Image.asset(
                                  'images/heart.png',
                                  fit: BoxFit.cover,
                                  width: 25,
                                )),
                            _createButton(
                                '250',
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
