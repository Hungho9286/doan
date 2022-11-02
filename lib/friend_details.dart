import 'package:doan/main.dart';
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
    Widget _imgSection = Image.asset(
      'images/profilebg.jpg',
      width: 400,
      height: 150,
      fit: BoxFit.cover,
    );
    Widget _avtSection = Container(
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
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 18),
                child: Text(
                  'frog',
                  style: TextStyle(
                    fontFamily: 'klavika',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 59, 101),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 15),
              ),
              Text(
                '1256398',
                style: TextStyle(
                  fontFamily: 'klavika',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 248, 125, 10),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person_remove,
              color: Colors.black,
              size: 60,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check_circle,
              color: Colors.black,
              size: 60,
            ),
          ),
        ],
      ),
    );
    Widget _imgProfile = Stack(
      children: [
        _imgSection,
        Positioned(
          top: 130,
          left: 140,
          child: _avtSection,
        ),
      ],
    );
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Friends'),
        ),
        body: Column(
          children: [
            UserAccountsDrawerHeader(
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
            ),
            TabBar(
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
                    Icons.home_outlined,
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
                    Text('data 2'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
