import 'package:doan/listfriend_chat.dart';
import 'package:doan/main.dart';
import 'package:doan/tabmenu_r.dart';
//import 'package:doan/tabmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Utils {
  //icon mau sac
  static Icon IconWithColor(
    IconData ic,
    Color c,
  ) {
    return Icon(
      ic,
      color: c,
    );
  }
}

class FriendDetail extends StatelessWidget {
  const FriendDetail({super.key});

  @override
  Widget build(BuildContext context) => FriendDetailHome();
}

class FriendDetailHome extends StatefulWidget {
  const FriendDetailHome({super.key});

  @override
  _FriendDetailHomeState createState() => _FriendDetailHomeState();
}

class _FriendDetailHomeState extends State<FriendDetailHome>
    with SingleTickerProviderStateMixin {
  @override
  late TabController _controller;
  void initState() {
    //khoi tao trang thai
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      TabHandle();
    });
  }

  void TabHandle() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    Widget _yes = Container(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 80,
        height: 40,
        child: ElevatedButton(
          child: Text(
            'YES',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          onPressed: () {
            //Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Color.fromARGB(255, 246, 122, 5),
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
    Widget _no = Container(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 80,
        height: 40,
        child: ElevatedButton(
          child: Text(
            'NO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Color.fromARGB(255, 43, 219, 8),
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
    Widget _chose = Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_yes, _no],
      ),
    );
    Widget _dare = Container(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 100,
        height: 50,
        child: ElevatedButton(
          child: Text(
            'DARE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Color.fromARGB(255, 246, 122, 5),
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
    Widget _chat = Container(
      padding: EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 100,
        height: 50,
        child: ElevatedButton(
          child: Text(
            'CHAT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Color.fromARGB(255, 9, 200, 35),
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
    Widget _imgSection = Image.asset(
      'images/profilebg.jpg',
      width: 500,
      height: 200,
      fit: BoxFit.cover,
    );

    Widget _avtSection = Container(
      padding: EdgeInsets.only(left: 10),
      child: CircleAvatar(
        radius: 45,
        backgroundColor: Color.fromARGB(255, 8, 59, 101),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('images/frog.jpeg'),
        ),
      ),
    );
    Widget _profile = Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'frog',
                      style: TextStyle(
                        fontFamily: 'klavika',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 8, 59, 101),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '1256398',
                      style: TextStyle(
                        fontFamily: 'klavika',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 248, 125, 10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
          ),
          IconButton(
            onPressed: () {
              //Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.symmetric(horizontal: 80),
                      backgroundColor: Color.fromARGB(213, 17, 17, 17),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text(
                        'warning!',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      content: Text(
                        'ARE YOU SURE?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      actions: [
                        _chose,
                      ],
                    );
                  });
            },
            icon: Icon(
              Icons.person_remove,
              color: Colors.black,
              size: 40,
            ),
          ),

          /*Padding(
            padding: EdgeInsets.only(left: 20),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_circle,
              color: Colors.black,
              size: 50,
            ),
          ),*/
        ],
      ),
    );
    Widget _imgProfile = Stack(
      children: [
        _imgSection,
        Positioned(
          top: 40,
          left: 10,
          child: Row(
            children: [
              _avtSection,
              _profile,
            ],
          ),
        ),
      ],
    );
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 213, 193, 17),
        ),
        body: Column(
          children: [
            // //Stack(
            // //children: [
            // _imgSection,
            // Positioned(
            //   top: 140,
            //   left: 10,
            //   child: _avtSection,
            // ),
            //],
            //),

            _imgSection,
            Row(
              children: [_avtSection, _profile],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_dare, _chat],
            ),
            /*UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/profilebg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      'images/frog.jpeg',
                    )),
              ),
              accountName: Text('Frog'),
              accountEmail: null,
            ),*/
            TabBar(
              padding: EdgeInsets.only(top: 5),
              indicatorColor: Color(4282542002),
              unselectedLabelColor: Colors.grey,
              controller: _controller,
              tabs: [
                Tab(
                  child: Utils.IconWithColor(
                    Icons.home_outlined,
                    _controller.index == 0 ? Color(4282542002) : Colors.grey,
                  ),
                ),
                Tab(
                  child: Utils.IconWithColor(
                    Icons.stacked_line_chart_rounded,
                    _controller.index == 1 ? Color(4282542002) : Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: TabBarView(
                  controller: _controller,
                  children: [
                    Text('data 1'),
                    TabMenuR(),
                  ],
                ),
              ),
            ),
          ],
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
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FriendDetail(),
                        ),
                      );*/
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
