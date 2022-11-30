import 'package:doan/friend_details.dart';
import 'package:doan/main.dart';
import 'package:doan/screen_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

class ListFriend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListFriendState();
}

class _ListFriendState extends State<ListFriend> {
  Widget _PopUpMenu() {
    return PopupMenuButton(
        icon: Icon(Icons.more_vert),
        itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.person_remove_alt_1_rounded),
                  title: Text('Huỷ kết bạn'),
                  //subtitle: Text('Hủy kết bạn với ...'),
                ),
                onTap: () {},
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.message_outlined),
                  title: Text('Nhắn tin'),
                  //subtitle: Text('chat'),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenChat(),
                    ),
                  );
                },
              ),
            ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Danh sách bạn bè',
            ),
            Icon(Icons.search),
          ],
        ),
      ),

      /*Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: ('Search'),
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),*/
      //),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              color: Color.fromARGB(255, 202, 199, 199),
              child: ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 8, 59, 101),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('images/gaoden.png'),
                  ),
                ),
                title: Text(
                  'gao đen',
                ),
                trailing: _PopUpMenu(),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 202, 199, 199),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 8, 59, 101),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('images/trubatgioi.jpg'),
                  ),
                ),
                title: Text('trư bát giới'),
                trailing: _PopUpMenu(),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 202, 199, 199),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenChat(),
                    ),
                  );
                },
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 8, 59, 101),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('images/frog.jpeg'),
                  ),
                ),
                title: Text('frog'),
                trailing: _PopUpMenu(),
              ),
            ),
            Card(
              color: Color.fromARGB(255, 202, 199, 199),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromARGB(255, 8, 59, 101),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage('images/khabanh.png'),
                  ),
                ),
                title: Text('khá bảnh'),
                trailing: _PopUpMenu(),
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
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Contact(),
                    ),
                  );*/
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
          ),
        ),
      ),
    );
  }
}
