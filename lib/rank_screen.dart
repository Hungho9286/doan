import 'package:doan/choose_categories.dart';
import 'package:doan/dropdown_cat.dart';
import 'package:doan/listfriend_chat.dart';
import 'package:doan/profile_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class RankScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen>
    with SingleTickerProviderStateMixin {
  @override
  late TabController _tabcontroller;
  void initState() {
    //khoi tao trang thai
    super.initState();
    _tabcontroller = TabController(length: 2, vsync: this);
    _tabcontroller.addListener(() {
      TabHandle();
    });
  }

  void TabHandle() {
    setState(() {});
  }

  Widget _TabDMLV = Container(
    child: Center(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      top: BorderSide(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Text(
                            'Điểm mỗi lĩnh vực',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: DropDownMenu(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(255, 14, 144, 18)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8.0, bottom: 8.0, left: 20, right: 20),
                              child: Text(
                                "Xếp hạng của tôi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            'top 2 - 256632',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 14, 144, 18)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 450,
            child: Container(
              padding: EdgeInsets.all(30),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Card(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        hoverColor: Colors.yellow,
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.yellow,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage('images/gaoden.png'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'gao đen',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '5555555',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: Color.fromARGB(255, 193, 194, 194),
                    elevation: 5,
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 193, 194, 194),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage('images/avatar.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Yuna Ogura',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 193, 194, 194),
                              ),
                            ),
                            Text(
                              '256632',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 193, 194, 194),
                              ),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.red,
                    elevation: 5,
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage('images/khabanh.png'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'khá bảnh',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              '199999',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '192020',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '185263',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '142663',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '142663',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '142663',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _TabDTCLV = Container(
    child: Center(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.5,
                  ),
                  top: BorderSide(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 1.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Điểm tất cả lĩnh vực',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 14, 144, 18)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 20, right: 20),
                          child: Text(
                            "Xếp hạng của tôi",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(
                        'top 3 - 226532',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 14, 144, 18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 450,
            child: Container(
              padding: EdgeInsets.all(30),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Card(
                    shadowColor: Colors.yellow,
                    elevation: 5,
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        hoverColor: Colors.yellow,
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.yellow,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage('images/gaoden.png'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'gao đen',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '356892',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: Color.fromARGB(255, 193, 194, 194),
                    elevation: 5,
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 193, 194, 194),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage('images/khabanh.png'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'khá bảnh',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 193, 194, 194),
                              ),
                            ),
                            Text(
                              '245632',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 193, 194, 194),
                              ),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    shadowColor: Colors.red,
                    elevation: 5,
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.red,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage('images/avatar.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Yuna Ogura',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text(
                              '226532',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '192020',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '185263',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '142663',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '142663',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 14, 144, 18),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('images/trubatgioi.jpg'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'trư bát giới',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                            Text(
                              '123456',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 14, 144, 18)),
                            ),
                          ],
                        ),
                        trailing: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
  Widget _header = Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  border: Border.all(width: 2, color: Colors.yellowAccent),
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
          padding: EdgeInsets.only(top: 30, left: 20, right: 10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  border: Border.all(width: 2, color: Colors.yellowAccent),
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
                  child: Image.asset('images/ticket.png', fit: BoxFit.cover)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30, left: 20, right: 10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  border: Border.all(width: 2, color: Colors.yellowAccent),
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
                  child: Image.asset('images/chao.png', fit: BoxFit.cover)),
            ],
          ),
        ),
      ],
    ),
  );

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        /*appBar: AppBar(
          title: _header,
          backgroundColor: Colors.white,
        ),*/
        body: Column(
          children: [
            _header,
            TabBar(
              indicatorPadding:
                  EdgeInsets.only(left: 60, top: 5, bottom: 5, right: 60),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.red,
              ),
              unselectedLabelColor: Colors.grey,
              controller: _tabcontroller,
              tabs: [
                Tab(
                  child: Icon(
                    Iconsax.personalcard,
                    color: _tabcontroller.index == 0
                        ? Color.fromARGB(255, 250, 194, 64)
                        : Colors.grey,
                  ),
                ),
                Tab(
                  child: Icon(
                    Iconsax.personalcard,
                    color: _tabcontroller.index == 1
                        ? Color.fromARGB(255, 250, 194, 64)
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: TabBarView(
                  controller: _tabcontroller,
                  children: [
                    _TabDMLV,
                    _TabDTCLV,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChooseCategories(),
                ),
              );
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
                          builder: (context) => Profile(),
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
